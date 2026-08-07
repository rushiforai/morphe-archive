.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final h:I

.field public static final i:I


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;

.field public d:I

.field public e:I

.field public f:Landroid/animation/Animator;

.field public g:Landroid/animation/Animator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x430c0000    # 140.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->h:I

    .line 8
    .line 9
    const/high16 v0, 0x42e80000    # 116.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->i:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 14
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->i:I

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->e:I

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->f:Landroid/animation/Animator;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->g:Landroid/animation/Animator;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->o()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->i(Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->m()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->h(Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gt70;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->f:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->g:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->b()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ge v0, v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorLightItemView;

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorLightItemView;->h()V

    .line 42
    .line 43
    .line 44
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public final g(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    .line 7
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic h(Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->g(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic i(Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->g(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->l(Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;->lights:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;->lights:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eq v0, v1, :cond_2

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    const/4 v0, 0x0

    .line 38
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-ge v0, v1, :cond_4

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorLightItemView;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;->lights:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyIndicatorLight;

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorLightItemView;->o(Lcom/p1/mobile/putong/live/base/data/BLivePkBountyIndicatorLight;)V

    .line 65
    .line 66
    .line 67
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    :goto_1
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

    .line 5
    .line 6
    sget v1, Ll/obc0;->I4:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;->tip:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->setMarqueeText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->j(Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->l(Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;)V
    .locals 5

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;->lights:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v2, 0x6

    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->h:I

    .line 22
    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->e:I

    .line 24
    .line 25
    :cond_1
    const/4 v0, 0x1

    .line 26
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 32
    .line 33
    .line 34
    move v0, v1

    .line 35
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-ge v0, v2, :cond_3

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    sget v3, Ll/yec0;->Q4:I

    .line 50
    .line 51
    const/4 v4, 0x0

    .line 52
    invoke-virtual {v2, v3, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorLightItemView;

    .line 57
    .line 58
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyIndicatorLight;

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorLightItemView;->p(Lcom/p1/mobile/putong/live/base/data/BLivePkBountyIndicatorLight;)V

    .line 65
    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 70
    .line 71
    const/4 v4, -0x2

    .line 72
    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 73
    .line 74
    .line 75
    const/high16 v4, 0x40a00000    # 5.0f

    .line 76
    .line 77
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    neg-int v4, v4

    .line 82
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 88
    .line 89
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 97
    .line 98
    invoke-virtual {v3, v2, v2}, Landroid/view/View;->measure(II)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 102
    .line 103
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 112
    .line 113
    iput v2, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 114
    .line 115
    invoke-virtual {p0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    .line 117
    .line 118
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 119
    .line 120
    const/high16 v3, 0x3f800000    # 1.0f

    .line 121
    .line 122
    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 123
    .line 124
    .line 125
    add-int/lit8 v0, v0, 0x1

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_3
    return-void
.end method

.method public final m()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->e:I

    .line 8
    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->d:I

    .line 10
    .line 11
    filled-new-array {v0, v2}, [I

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v2, Ll/ft70;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0}, Ll/ft70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;Landroid/animation/ValueAnimator;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 v2, 0x12c

    .line 28
    .line 29
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    new-instance v10, Landroid/view/animation/AccelerateInterpolator;

    .line 35
    .line 36
    invoke-direct {v10}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 37
    .line 38
    .line 39
    const/4 v2, 0x2

    .line 40
    new-array v11, v2, [F

    .line 41
    .line 42
    fill-array-data v11, :array_0

    .line 43
    .line 44
    .line 45
    const-string v5, "alpha"

    .line 46
    .line 47
    const-wide/16 v6, 0x0

    .line 48
    .line 49
    const-wide/16 v8, 0x12c

    .line 50
    .line 51
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    new-array v2, v2, [Landroid/animation/Animator;

    .line 56
    .line 57
    aput-object v3, v2, v1

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    aput-object v0, v2, v1

    .line 61
    .line 62
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->g:Landroid/animation/Animator;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    nop

    .line 73
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public n()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->getMarqueeText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->d:I

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->e:I

    .line 25
    .line 26
    filled-new-array {v0, v1}, [I

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/ct70;

    .line 35
    .line 36
    invoke-direct {v1, p0, v0}, Ll/ct70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;Landroid/animation/ValueAnimator;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 40
    .line 41
    .line 42
    const-wide/16 v1, 0x12c

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    .line 47
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->b:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    new-instance v9, Landroid/view/animation/AccelerateInterpolator;

    .line 50
    .line 51
    invoke-direct {v9}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 52
    .line 53
    .line 54
    const/4 v1, 0x2

    .line 55
    new-array v10, v1, [F

    .line 56
    .line 57
    fill-array-data v10, :array_0

    .line 58
    .line 59
    .line 60
    const-string v4, "alpha"

    .line 61
    .line 62
    const-wide/16 v5, 0x0

    .line 63
    .line 64
    const-wide/16 v7, 0x12c

    .line 65
    .line 66
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    new-array v1, v1, [Landroid/animation/Animator;

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    aput-object v2, v1, v3

    .line 74
    .line 75
    const/4 v3, 0x1

    .line 76
    aput-object v0, v1, v3

    .line 77
    .line 78
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->f:Landroid/animation/Animator;

    .line 83
    .line 84
    new-instance v0, Ll/dt70;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/dt70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v2, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->f:Landroid/animation/Animator;

    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    nop

    .line 99
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final o()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;

    .line 8
    .line 9
    const/16 v1, 0x3e8

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->setAnimDuration(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;

    .line 15
    .line 16
    new-instance v1, Ll/et70;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/et70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;)V

    .line 19
    .line 20
    .line 21
    const/16 p0, 0x12c

    .line 22
    .line 23
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkHorizontalMarqueeView;->e(ILjava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
