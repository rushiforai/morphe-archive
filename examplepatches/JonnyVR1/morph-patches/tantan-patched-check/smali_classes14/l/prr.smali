.class public Ll/prr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/grr;


# instance fields
.field public final a:Lv/VMarqueeText;

.field public final b:Lv/VText;

.field public c:I

.field public d:Landroid/animation/Animator;

.field public e:Ll/kcg0;

.field public f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public g:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public final h:Landroid/widget/FrameLayout;

.field public final i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/prr;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->b:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    iput-object v0, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->i:Lv/VMarqueeText;

    .line 14
    .line 15
    iput-object v1, p0, Ll/prr;->a:Lv/VMarqueeText;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->j:Lv/VText;

    .line 18
    .line 19
    iput-object v1, p0, Ll/prr;->b:Lv/VText;

    .line 20
    .line 21
    sget v1, Ll/qa00;->i:I

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/prr;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->c:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 40
    .line 41
    sget v1, Ll/bnl0;->e:I

    .line 42
    .line 43
    invoke-direct {p1, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic k(Ll/prr;ILl/grr;Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/prr;->s(ILl/grr;Landroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic l(Ll/prr;ILl/grr;Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/prr;->v(ILl/grr;Landroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic m(Ll/prr;Ll/msr;Ljava/util/List;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/prr;->x(Ll/msr;Ljava/util/List;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic n(Ll/prr;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/prr;->u()V

    return-void
.end method

.method public static synthetic o(Ll/prr;Ll/msr;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/prr;->w(Ll/msr;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/prr;Ll/msr;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/prr;->t(Ll/msr;Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic q(Ll/prr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    return-object p0
.end method

.method public static bridge synthetic r(Ll/prr;)Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    return-object p0
.end method


# virtual methods
.method public A(Landroid/view/View;FFF)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p3}, Landroid/view/View;->setTranslationY(F)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p4}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a()I
    .locals 0

    .line 1
    const p0, -0x16300

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public b(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/prr;->c:I

    .line 3
    .line 4
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardLives:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;

    .line 11
    .line 12
    iget-object v2, p0, Ll/prr;->e:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {v2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Ll/prr;->z(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    new-instance v2, Ll/jrr;

    .line 23
    .line 24
    invoke-direct {v2, p0, p1, v1, p2}, Ll/jrr;-><init>(Ll/prr;Ll/msr;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v2, 0x4

    .line 31
    .line 32
    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 33
    .line 34
    const-wide/16 v4, 0x8

    .line 35
    .line 36
    invoke-static {v4, v5, v2, v3, p2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p1, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    new-instance v0, Ll/krr;

    .line 53
    .line 54
    invoke-direct {v0, p0, p1, v1}, Ll/krr;-><init>(Ll/prr;Ll/msr;Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Ll/prr;->e:Ll/kcg0;

    .line 66
    .line 67
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/high16 v1, 0x42200000    # 40.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    int-to-float v1, v1

    .line 12
    const/4 v2, 0x0

    .line 13
    const/high16 v3, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-virtual {p0, v0, v2, v1, v3}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    const/high16 v1, 0x41200000    # 10.0f

    .line 23
    .line 24
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->g:Lv/VDraweeView;

    .line 34
    .line 35
    const/4 v1, 0x4

    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->g:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->g:Lv/VDraweeView;

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleX(F)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->g:Lv/VDraweeView;

    .line 56
    .line 57
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 63
    .line 64
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 77
    .line 78
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 88
    .line 89
    const/high16 v1, 0x43040000    # 132.0f

    .line 90
    .line 91
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 96
    .line 97
    iget-object v1, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 103
    .line 104
    invoke-virtual {p0, v0, v2, v2, v3}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 108
    .line 109
    const/4 v1, 0x1

    .line 110
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->d:Landroid/view/View;

    .line 116
    .line 117
    invoke-virtual {p0, v0, v2, v2, v3}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->d:Landroid/view/View;

    .line 123
    .line 124
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    const p0, -0x5a6c6

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    const/high16 p0, 0x43080000    # 136.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    const/high16 p0, 0x43080000    # 136.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    sget p0, Ll/nbc0;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public h(Landroid/animation/ValueAnimator;Ll/grr;)V
    .locals 3

    .line 1
    instance-of v0, p2, Ll/vrr;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/high16 v1, 0x42300000    # 44.0f

    .line 6
    .line 7
    :goto_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/high16 v1, 0x425c0000    # 55.0f

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :goto_1
    const/high16 v2, 0x41200000    # 10.0f

    .line 16
    .line 17
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sub-int/2addr v1, v2

    .line 22
    iget-object v2, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, v2, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_1
    iget-object v0, v2, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->g:Lv/VDraweeView;

    .line 30
    .line 31
    :goto_2
    new-instance v2, Ll/lrr;

    .line 32
    .line 33
    invoke-direct {v2, p0, v1, p2, v0}, Ll/lrr;-><init>(Ll/prr;ILl/grr;Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 37
    .line 38
    .line 39
    new-instance p2, Ll/prr$b;

    .line 40
    .line 41
    invoke-direct {p2, p0, v0}, Ll/prr$b;-><init>(Ll/prr;Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public j(Landroid/animation/ValueAnimator;Ll/grr;)V
    .locals 3

    .line 1
    instance-of v0, p2, Ll/vrr;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/high16 v1, 0x42300000    # 44.0f

    .line 6
    .line 7
    :goto_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/high16 v1, 0x425c0000    # 55.0f

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :goto_1
    const/high16 v2, 0x41200000    # 10.0f

    .line 16
    .line 17
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sub-int/2addr v1, v2

    .line 22
    iget-object v2, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, v2, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_1
    iget-object v0, v2, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->g:Lv/VDraweeView;

    .line 30
    .line 31
    :goto_2
    new-instance v2, Ll/orr;

    .line 32
    .line 33
    invoke-direct {v2, p0, v1, p2, v0}, Ll/orr;-><init>(Ll/prr;ILl/grr;Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/prr$a;

    .line 40
    .line 41
    invoke-direct {v1, p0, v0, p2}, Ll/prr$a;-><init>(Ll/prr;Landroid/view/View;Ll/grr;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic s(ILl/grr;Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 5

    .line 1
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    check-cast p4, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->d:Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1, v1, p4}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    const/high16 v2, 0x42200000    # 40.0f

    .line 24
    .line 25
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    int-to-float v2, v2

    .line 30
    mul-float/2addr v2, p4

    .line 31
    const/high16 v3, 0x3f800000    # 1.0f

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    const/high16 v2, 0x41200000    # 10.0f

    .line 41
    .line 42
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    int-to-float v2, v2

    .line 47
    int-to-float p1, p1

    .line 48
    sub-float v4, v3, p4

    .line 49
    .line 50
    mul-float/2addr p1, v4

    .line 51
    add-float/2addr v2, p1

    .line 52
    float-to-int p1, v2

    .line 53
    invoke-static {v0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 54
    .line 55
    .line 56
    invoke-interface {p2}, Ll/grr;->f()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    const/high16 p2, 0x40800000    # 4.0f

    .line 61
    .line 62
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    sub-int/2addr p1, p2

    .line 67
    iget-object p2, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 68
    .line 69
    const/high16 v0, 0x43040000    # 132.0f

    .line 70
    .line 71
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    sub-int/2addr v0, p1

    .line 76
    int-to-float v0, v0

    .line 77
    mul-float/2addr v0, p4

    .line 78
    int-to-float p1, p1

    .line 79
    add-float/2addr v0, p1

    .line 80
    float-to-int p1, v0

    .line 81
    invoke-static {p2, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 85
    .line 86
    invoke-virtual {p0, p1, v1, v1, p4}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 87
    .line 88
    .line 89
    const/high16 p1, 0x40000000    # 2.0f

    .line 90
    .line 91
    mul-float/2addr p4, p1

    .line 92
    sub-float/2addr v3, p4

    .line 93
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    invoke-virtual {p0, p3, v1, v1, p1}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p3, v4}, Landroid/view/View;->setScaleX(F)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p3, v4}, Landroid/view/View;->setScaleY(F)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final synthetic t(Ll/msr;Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/prr;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/prr;->g:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    :cond_1
    iget v0, p0, Ll/prr;->c:I

    .line 17
    .line 18
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2}, Ll/prr;->z(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/prr;->g:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->q()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->c:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    iget-object v1, p0, Ll/prr;->g:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Ll/prr;->g:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic v(ILl/grr;Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 5

    .line 1
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    check-cast p4, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    sub-float p4, v0, p4

    .line 14
    .line 15
    iget-object v1, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {p0, v1, v2, v2, p4}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->d:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0, v1, v2, v2, p4}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    const/high16 v3, 0x42200000    # 40.0f

    .line 33
    .line 34
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    int-to-float v3, v3

    .line 39
    mul-float/2addr v3, p4

    .line 40
    invoke-virtual {p0, v1, v2, v3, v0}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    const/high16 v3, 0x41200000    # 10.0f

    .line 48
    .line 49
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    int-to-float v3, v3

    .line 54
    int-to-float p1, p1

    .line 55
    sub-float v4, v0, p4

    .line 56
    .line 57
    mul-float/2addr p1, v4

    .line 58
    add-float/2addr v3, p1

    .line 59
    float-to-int p1, v3

    .line 60
    invoke-static {v1, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    invoke-interface {p2}, Ll/grr;->f()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    const/high16 p2, 0x40800000    # 4.0f

    .line 68
    .line 69
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    sub-int/2addr p1, p2

    .line 74
    iget-object p2, p0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 75
    .line 76
    const/high16 v1, 0x43040000    # 132.0f

    .line 77
    .line 78
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    sub-int/2addr v1, p1

    .line 83
    int-to-float v1, v1

    .line 84
    mul-float/2addr v1, p4

    .line 85
    int-to-float p1, p1

    .line 86
    add-float/2addr v1, p1

    .line 87
    float-to-int p1, v1

    .line 88
    invoke-static {p2, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 89
    .line 90
    .line 91
    const/high16 p1, 0x40000000    # 2.0f

    .line 92
    .line 93
    mul-float/2addr p4, p1

    .line 94
    sub-float/2addr v0, p4

    .line 95
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    invoke-virtual {p0, p3, v2, v2, p1}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p3, v4}, Landroid/view/View;->setScaleX(F)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p3, v4}, Landroid/view/View;->setScaleY(F)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final synthetic w(Ll/msr;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/msr;->j3()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result p4

    .line 10
    iget p0, p0, Ll/prr;->c:I

    .line 11
    .line 12
    if-le p4, p0, :cond_0

    .line 13
    .line 14
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    iget-boolean p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardEnterLive:Z

    .line 23
    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;->liveId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;->liveId:Ljava/lang/String;

    .line 37
    .line 38
    const/4 p2, 0x1

    .line 39
    invoke-virtual {p1, p0, p2}, Ll/msr;->f3(Ljava/lang/String;Z)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final synthetic x(Ll/msr;Ljava/util/List;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/prr;->y(Ll/msr;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final y(Ll/msr;Ljava/util/List;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/msr;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Ll/prr;->c:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    add-int/2addr v1, v2

    .line 7
    iput v1, v0, Ll/prr;->c:I

    .line 8
    .line 9
    iget-object v1, v0, Ll/prr;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 10
    .line 11
    iput-object v1, v0, Ll/prr;->g:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 14
    .line 15
    iget-object v3, v0, Ll/prr;->h:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-direct {v1, v3}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, v0, Ll/prr;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 25
    .line 26
    iget-object v3, v0, Ll/prr;->i:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 27
    .line 28
    iget-object v3, v3, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->c:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    sget v5, Ll/bnl0;->e:I

    .line 33
    .line 34
    invoke-direct {v4, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    iget v1, v0, Ll/prr;->c:I

    .line 41
    .line 42
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    const/4 v4, 0x0

    .line 47
    if-lt v1, v3, :cond_0

    .line 48
    .line 49
    iput v4, v0, Ll/prr;->c:I

    .line 50
    .line 51
    :cond_0
    sget-object v11, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 52
    .line 53
    iget-object v5, v0, Ll/prr;->g:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 54
    .line 55
    sget v1, Ll/qa00;->j:I

    .line 56
    .line 57
    neg-int v3, v1

    .line 58
    int-to-float v3, v3

    .line 59
    const/4 v13, 0x2

    .line 60
    new-array v12, v13, [F

    .line 61
    .line 62
    const/4 v14, 0x0

    .line 63
    aput v14, v12, v4

    .line 64
    .line 65
    aput v3, v12, v2

    .line 66
    .line 67
    const-string v6, "translationX"

    .line 68
    .line 69
    const-wide/16 v7, 0x0

    .line 70
    .line 71
    const-wide/16 v9, 0xc8

    .line 72
    .line 73
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    iget-object v5, v0, Ll/prr;->g:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 78
    .line 79
    new-array v12, v13, [F

    .line 80
    .line 81
    fill-array-data v12, :array_0

    .line 82
    .line 83
    .line 84
    const-string v6, "alpha"

    .line 85
    .line 86
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object v15

    .line 90
    iget-object v5, v0, Ll/prr;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 91
    .line 92
    int-to-float v1, v1

    .line 93
    new-array v12, v13, [F

    .line 94
    .line 95
    aput v1, v12, v4

    .line 96
    .line 97
    aput v14, v12, v2

    .line 98
    .line 99
    const-string v6, "translationX"

    .line 100
    .line 101
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iget-object v5, v0, Ll/prr;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 106
    .line 107
    new-array v12, v13, [F

    .line 108
    .line 109
    fill-array-data v12, :array_1

    .line 110
    .line 111
    .line 112
    const-string v6, "alpha"

    .line 113
    .line 114
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    iget-object v4, v0, Ll/prr;->d:Landroid/animation/Animator;

    .line 119
    .line 120
    if-eqz v4, :cond_1

    .line 121
    .line 122
    invoke-virtual {v4}, Landroid/animation/Animator;->cancel()V

    .line 123
    .line 124
    .line 125
    :cond_1
    filled-new-array {v3, v15, v1, v2}, [Landroid/animation/Animator;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iput-object v1, v0, Ll/prr;->d:Landroid/animation/Animator;

    .line 134
    .line 135
    new-instance v2, Ll/mrr;

    .line 136
    .line 137
    move-object/from16 v3, p1

    .line 138
    .line 139
    move-object/from16 v4, p2

    .line 140
    .line 141
    invoke-direct {v2, v0, v3, v4}, Ll/mrr;-><init>(Ll/prr;Ll/msr;Ljava/util/List;)V

    .line 142
    .line 143
    .line 144
    invoke-static {v1, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 145
    .line 146
    .line 147
    iget-object v1, v0, Ll/prr;->d:Landroid/animation/Animator;

    .line 148
    .line 149
    new-instance v2, Ll/nrr;

    .line 150
    .line 151
    invoke-direct {v2, v0}, Ll/nrr;-><init>(Ll/prr;)V

    .line 152
    .line 153
    .line 154
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 155
    .line 156
    .line 157
    iget-object v0, v0, Ll/prr;->d:Landroid/animation/Animator;

    .line 158
    .line 159
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    :array_1
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final z(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/prr;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;->roomCoverUrl:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Ll/prr;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;->roomCoverUrl:Ljava/lang/String;

    .line 25
    .line 26
    const/high16 v1, 0x43040000    # 132.0f

    .line 27
    .line 28
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const-string v3, "context_square"

    .line 37
    .line 38
    invoke-static {v3, p1, v0, v2, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;->videoCaptureUrl:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_2

    .line 48
    .line 49
    iget-object p1, p0, Ll/prr;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 50
    .line 51
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;->videoCaptureUrl:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->n(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Ll/prr;->a:Lv/VMarqueeText;

    .line 57
    .line 58
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;->title:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/prr;->b:Lv/VText;

    .line 64
    .line 65
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;->subTitle:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
