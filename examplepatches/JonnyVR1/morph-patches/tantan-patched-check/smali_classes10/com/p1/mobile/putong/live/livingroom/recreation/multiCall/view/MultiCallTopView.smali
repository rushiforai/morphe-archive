.class public Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/ar10<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/ViewGroup;

.field public b:F

.field public c:F

.field public d:Ll/ar10;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ar10<",
            "*>;"
        }
    .end annotation
.end field

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

.field public h:Z

.field public i:Z

.field public j:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->h:Z

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->i:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->h:Z

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->i:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->h:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->i:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getPosition()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    int-to-long p0, p0

    .line 9
    cmp-long p0, v0, p0

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->m(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->p(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(ILcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    sub-int/2addr p1, v0

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->n(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic f(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getPosition()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    int-to-long p0, p0

    .line 9
    cmp-long p0, v0, p0

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->j:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->j:Lv/VText;

    .line 15
    .line 16
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->j:Lv/VText;

    .line 24
    .line 25
    const/4 v1, -0x1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->j:Lv/VText;

    .line 30
    .line 31
    const/high16 v1, 0x41700000    # 15.0f

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->j:Lv/VText;

    .line 37
    .line 38
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->h0:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->j:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 56
    .line 57
    const/4 v1, -0x2

    .line 58
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 59
    .line 60
    .line 61
    const/16 v1, 0x31

    .line 62
    .line 63
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 64
    .line 65
    const/high16 v1, 0x432e0000    # 174.0f

    .line 66
    .line 67
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->j:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->j:Lv/VText;

    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final B(Ll/tm10;Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tm10;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    move v1, v0

    .line 6
    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-ge v1, v2, :cond_2

    .line 11
    .line 12
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 17
    .line 18
    add-int/lit8 v3, v1, 0x1

    .line 19
    .line 20
    invoke-virtual {p1, v3, v0, v0}, Ll/tm10;->b(III)Landroid/widget/FrameLayout$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    if-eqz v4, :cond_1

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->p0()Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-nez v5, :cond_0

    .line 31
    .line 32
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {p0, v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    move v1, v3

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->setViewVisible(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->h:Z

    .line 10
    .line 11
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hr10;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ar10;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->j(Ll/ar10;)V

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

.method public j(Ll/ar10;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ar10<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 2
    .line 3
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->o0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->j:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final synthetic m(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ar10;->f4(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ar10;->e4(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    :goto_0
    const/16 v1, 0x9

    .line 16
    .line 17
    if-ge v0, v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget v2, Ll/yec0;->g4:I

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-static {v1, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 31
    .line 32
    add-int/lit8 v2, v0, 0x1

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->setViewPosition(I)V

    .line 35
    .line 36
    .line 37
    new-instance v3, Ll/br10;

    .line 38
    .line 39
    invoke-direct {v3, p0, v0}, Ll/br10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;I)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    iget-object v3, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->g:Lv/VLinear;

    .line 46
    .line 47
    new-instance v4, Ll/cr10;

    .line 48
    .line 49
    invoke-direct {v4, p0, v0}, Ll/cr10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move v0, v2

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    if-eq v0, v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->c:F

    .line 17
    .line 18
    sub-float/2addr v0, v2

    .line 19
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/high16 v2, 0x41200000    # 10.0f

    .line 24
    .line 25
    cmpl-float v0, v0, v2

    .line 26
    .line 27
    if-gtz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->b:F

    .line 34
    .line 35
    sub-float/2addr p1, v0

    .line 36
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    cmpl-float p1, p1, v2

    .line 41
    .line 42
    if-lez p1, :cond_2

    .line 43
    .line 44
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->a:Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->a:Landroid/view/ViewGroup;

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :cond_2
    return v1

    .line 60
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->c:F

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->b:F

    .line 71
    .line 72
    :goto_0
    return v1
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ar10;->i4(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(IIZLjava/lang/Float;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/bf10;->Y(II)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_2

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-ge p2, p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 17
    .line 18
    add-int/lit8 p1, p1, -0x1

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->p0()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t0(ZLjava/lang/Float;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method

.method public s(Ljava/util/List;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->h:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->f:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->f:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ll/tm10;

    .line 15
    .line 16
    invoke-direct {v0, p2}, Ll/tm10;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->B(Ll/tm10;Ljava/util/ArrayList;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-ge v0, v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 40
    .line 41
    new-instance v2, Ll/fr10;

    .line 42
    .line 43
    invoke-direct {v2, v0}, Ll/fr10;-><init>(I)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->p0()Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_1

    .line 57
    .line 58
    add-int/lit8 v3, v0, 0x1

    .line 59
    .line 60
    invoke-virtual {p0, v1, v2, v3, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->y(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    return-void
.end method

.method public setSwallowTarget(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setViewVisible(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/data/User;II)V
    .locals 1

    .line 1
    invoke-static {p2, p3}, Ll/bf10;->Y(II)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_4

    .line 6
    .line 7
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-ge p3, p2, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    sub-int/2addr p2, v0

    .line 20
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 25
    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->p0()Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-nez p3, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-nez p3, :cond_3

    .line 38
    .line 39
    iget-object p3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p3}, Ll/bf10;->W(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-eqz p3, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v0, 0x0

    .line 49
    :cond_3
    :goto_0
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->setFollowView(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    if-nez p3, :cond_4

    .line 57
    .line 58
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->r:Lv/VImage;

    .line 59
    .line 60
    new-instance p3, Ll/gr10;

    .line 61
    .line 62
    invoke-direct {p3, p0, p1}, Ll/gr10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Lcom/p1/mobile/putong/data/User;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    :goto_1
    return-void
.end method

.method public v()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->p0()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->B0()V

    .line 25
    .line 26
    .line 27
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-void
.end method

.method public w(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 17
    .line 18
    new-instance v2, Ll/er10;

    .line 19
    .line 20
    invoke-direct {v2, v0}, Ll/er10;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->p0()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->J0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getPlayersList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v1, v2, :cond_1

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->e:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 21
    .line 22
    new-instance v3, Ll/dr10;

    .line 23
    .line 24
    invoke-direct {v3, v1}, Ll/dr10;-><init>(I)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->p0()Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-eqz v4, :cond_0

    .line 38
    .line 39
    invoke-virtual {v2, v3, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->z0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0, p4}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->u0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ll/i6t;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2, p1, p4}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->z(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string p1, "renderSinGleCall:callId="

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p1, ",position="

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p1, ",state="

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public final z(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-nez p1, :cond_3

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->h:Z

    .line 4
    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->h:Z

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/ar10;->h4()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 21
    .line 22
    invoke-virtual {p2}, Ll/ar10;->j4()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    const/4 v0, 0x1

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 32
    .line 33
    invoke-virtual {p1, p2, v0, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->w0(Ll/ar10;ZLjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ll/ar10;->H4(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->i:Z

    .line 45
    .line 46
    if-nez p2, :cond_1

    .line 47
    .line 48
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->i:Z

    .line 49
    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 51
    .line 52
    invoke-virtual {p2}, Ll/ar10;->k4()Z

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    invoke-static {p2}, Ll/jr10;->n(Z)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->d:Ll/ar10;

    .line 62
    .line 63
    invoke-virtual {p2, p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->w0(Ll/ar10;ZLjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->i:Z

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->k()V

    .line 70
    .line 71
    .line 72
    :cond_3
    return-void
.end method
