.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Lv/VProgressBar;

.field public g:Lv/VDraweeView;

.field public h:Ll/jjs;

.field public i:Ll/fsj;

.field public j:Z

.field public k:Landroid/animation/Animator;

.field public l:Landroid/animation/Animator;

.field public m:Landroid/animation/AnimatorSet;

.field public n:Landroid/animation/AnimatorSet;

.field public o:I

.field public p:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->o:I

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->p:Z

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->o:I

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->p:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->o:I

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->p:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->q(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->o(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;[ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->s([ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->n()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->p()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->r()V

    return-void
.end method


# virtual methods
.method public final A()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->m:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-wide/16 v2, 0x140

    .line 16
    .line 17
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 22
    .line 23
    .line 24
    new-instance v3, Ll/vsj;

    .line 25
    .line 26
    invoke-direct {v3, p0}, Ll/vsj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 30
    .line 31
    .line 32
    new-instance v3, Ll/wsj;

    .line 33
    .line 34
    invoke-direct {v3, p0}, Ll/wsj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v3}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 41
    .line 42
    new-array v4, v0, [F

    .line 43
    .line 44
    fill-array-data v4, :array_1

    .line 45
    .line 46
    .line 47
    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 48
    .line 49
    invoke-static {v3, v5, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-wide/16 v4, 0xa0

    .line 54
    .line 55
    invoke-virtual {v3, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v4, v5}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 62
    .line 63
    .line 64
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->m:Landroid/animation/AnimatorSet;

    .line 70
    .line 71
    new-array v0, v0, [Landroid/animation/Animator;

    .line 72
    .line 73
    const/4 v4, 0x0

    .line 74
    aput-object v1, v0, v4

    .line 75
    .line 76
    const/4 v1, 0x1

    .line 77
    aput-object v3, v0, v1

    .line 78
    .line 79
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->m:Landroid/animation/AnimatorSet;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    nop

    .line 89
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public B()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->n:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->n:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    new-array v1, v0, [F

    .line 12
    .line 13
    fill-array-data v1, :array_0

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-wide/16 v2, 0x140

    .line 21
    .line 22
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 27
    .line 28
    .line 29
    new-instance v3, Ll/usj;

    .line 30
    .line 31
    invoke-direct {v3, p0}, Ll/usj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 38
    .line 39
    new-array v4, v0, [F

    .line 40
    .line 41
    fill-array-data v4, :array_1

    .line 42
    .line 43
    .line 44
    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 45
    .line 46
    invoke-static {v3, v5, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v3, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 51
    .line 52
    .line 53
    const-wide/16 v4, 0xa0

    .line 54
    .line 55
    invoke-virtual {v3, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 59
    .line 60
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->n:Landroid/animation/AnimatorSet;

    .line 64
    .line 65
    new-array v0, v0, [Landroid/animation/Animator;

    .line 66
    .line 67
    const/4 v4, 0x0

    .line 68
    aput-object v1, v0, v4

    .line 69
    .line 70
    const/4 v1, 0x1

    .line 71
    aput-object v3, v0, v1

    .line 72
    .line 73
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->n:Landroid/animation/AnimatorSet;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    nop

    .line 83
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final C()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h:Ll/jjs;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jjs;->g()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowPreviewText:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->x(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->o:I

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->y(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->o:I

    .line 31
    .line 32
    return-void
.end method

.method public final D([ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;Z)V
    .locals 3
    .param p2    # Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h()V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    const/high16 p3, 0x3f800000    # 1.0f

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h:Ll/jjs;

    .line 10
    .line 11
    invoke-virtual {p3}, Ll/jjs;->e()F

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->g:Lv/VDraweeView;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->g:Lv/VDraweeView;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h:Ll/jjs;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "context_livingAct"

    .line 32
    .line 33
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->f:Lv/VProgressBar;

    .line 37
    .line 38
    float-to-int v1, p3

    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->z()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h:Ll/jjs;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/jjs;->a()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    const/high16 v0, 0x42c80000    # 100.0f

    .line 54
    .line 55
    cmpl-float p3, p3, v0

    .line 56
    .line 57
    if-nez p3, :cond_2

    .line 58
    .line 59
    if-nez p2, :cond_1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->i:Ll/fsj;

    .line 63
    .line 64
    new-instance v0, Ll/rsj;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/rsj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;)V

    .line 67
    .line 68
    .line 69
    new-instance v1, Ll/ssj;

    .line 70
    .line 71
    invoke-direct {v1, p0, p1, p2}, Ll/ssj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;[ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p3, p1, p2, v0, v1}, Ll/fsj;->e([ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;Ll/x20;Ll/x20;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_1
    return-void
.end method

.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xsj;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public i(Ll/x20;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->l:Landroid/animation/Animator;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j()V

    .line 11
    .line 12
    .line 13
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->l:Landroid/animation/Animator;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->l:Landroid/animation/Animator;

    .line 19
    .line 20
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/bri0;

    .line 24
    .line 25
    invoke-direct {v1, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->l:Landroid/animation/Animator;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final j()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 4
    .line 5
    const/high16 v2, 0x42700000    # 60.0f

    .line 6
    .line 7
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    int-to-float v2, v2

    .line 12
    const/4 v9, 0x2

    .line 13
    new-array v8, v9, [F

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    aput v4, v8, v3

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    aput v2, v8, v3

    .line 21
    .line 22
    sget-object v2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 23
    .line 24
    const-wide/16 v3, 0x0

    .line 25
    .line 26
    const-wide/16 v5, 0xb4

    .line 27
    .line 28
    const/4 v7, 0x0

    .line 29
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v10, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 34
    .line 35
    sget-object v11, Ll/gt0;->i:Landroid/util/Property;

    .line 36
    .line 37
    new-array v2, v9, [F

    .line 38
    .line 39
    fill-array-data v2, :array_0

    .line 40
    .line 41
    .line 42
    const-wide/16 v12, 0x0

    .line 43
    .line 44
    const-wide/16 v14, 0xb4

    .line 45
    .line 46
    const/16 v16, 0x0

    .line 47
    .line 48
    move-object/from16 v17, v2

    .line 49
    .line 50
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v10, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 55
    .line 56
    new-array v3, v9, [F

    .line 57
    .line 58
    fill-array-data v3, :array_1

    .line 59
    .line 60
    .line 61
    sget-object v11, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 62
    .line 63
    const-wide/16 v14, 0xe6

    .line 64
    .line 65
    move-object/from16 v17, v3

    .line 66
    .line 67
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    filled-new-array {v1, v2, v3}, [Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->l:Landroid/animation/Animator;

    .line 80
    .line 81
    return-void

    .line 82
    nop

    .line 83
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final k()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/high16 v1, 0x42700000    # 60.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    const/high16 v8, 0x41200000    # 10.0f

    .line 11
    .line 12
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    neg-int v2, v2

    .line 17
    int-to-float v2, v2

    .line 18
    const/4 v9, 0x2

    .line 19
    new-array v7, v9, [F

    .line 20
    .line 21
    const/4 v10, 0x0

    .line 22
    aput v1, v7, v10

    .line 23
    .line 24
    const/4 v11, 0x1

    .line 25
    aput v2, v7, v11

    .line 26
    .line 27
    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 28
    .line 29
    const-wide/16 v2, 0x64

    .line 30
    .line 31
    const-wide/16 v4, 0xb4

    .line 32
    .line 33
    const/4 v6, 0x0

    .line 34
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    move-result-object v12

    .line 38
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    neg-int v2, v2

    .line 43
    int-to-float v2, v2

    .line 44
    new-array v7, v9, [F

    .line 45
    .line 46
    aput v2, v7, v10

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    aput v2, v7, v11

    .line 50
    .line 51
    const-wide/16 v2, 0x0

    .line 52
    .line 53
    const-wide/16 v4, 0x78

    .line 54
    .line 55
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    filled-new-array {v12, v1}, [Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 68
    .line 69
    new-array v7, v9, [F

    .line 70
    .line 71
    fill-array-data v7, :array_0

    .line 72
    .line 73
    .line 74
    const-wide/16 v2, 0x64

    .line 75
    .line 76
    const-wide/16 v4, 0xb4

    .line 77
    .line 78
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object v10

    .line 82
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 83
    .line 84
    new-array v7, v9, [F

    .line 85
    .line 86
    fill-array-data v7, :array_1

    .line 87
    .line 88
    .line 89
    const-wide/16 v2, 0x0

    .line 90
    .line 91
    const-wide/16 v4, 0x78

    .line 92
    .line 93
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    filled-new-array {v10, v1}, [Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {v1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 102
    .line 103
    .line 104
    move-result-object v10

    .line 105
    new-array v7, v9, [F

    .line 106
    .line 107
    fill-array-data v7, :array_2

    .line 108
    .line 109
    .line 110
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 111
    .line 112
    const-wide/16 v2, 0x64

    .line 113
    .line 114
    const-wide/16 v4, 0xe6

    .line 115
    .line 116
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    filled-new-array {v8, v10, v0}, [Landroid/animation/Animator;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->k:Landroid/animation/Animator;

    .line 129
    .line 130
    return-void

    .line 131
    :array_0
    .array-data 4
        0x0
        0x3f8ccccd    # 1.1f
    .end array-data

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    :array_1
    .array-data 4
        0x3f8ccccd    # 1.1f
        0x3f800000    # 1.0f
    .end array-data

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final l()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/n0k;->e(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/n0k;->e(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final m(Ll/jjs;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h:Ll/jjs;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/jjs;->q(Ll/jjs;)Z

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

.method public final synthetic n()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->v()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic o(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->d:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->l()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/fsj;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/fsj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->i:Ll/fsj;

    .line 16
    .line 17
    return-void
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->d:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic q(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->d:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->p:Z

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic s([ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h:Ll/jjs;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jjs;->b()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->p:Z

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h:Ll/jjs;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/jjs;->u()V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->D([ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 15
    .line 16
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    aget v2, v1, v2

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    div-int/2addr p1, v0

    .line 15
    add-int/2addr v2, p1

    .line 16
    const/4 p1, 0x1

    .line 17
    aget p1, v1, p1

    .line 18
    .line 19
    const/high16 v0, 0x42300000    # 44.0f

    .line 20
    .line 21
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    sub-int/2addr v2, v0

    .line 26
    int-to-float v0, v2

    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 28
    .line 29
    .line 30
    const/high16 v0, 0x42700000    # 60.0f

    .line 31
    .line 32
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    sub-int/2addr p1, v0

    .line 37
    sget v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;->i:I

    .line 38
    .line 39
    sub-int/2addr p1, v0

    .line 40
    int-to-float p1, p1

    .line 41
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h:Ll/jjs;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->k:Landroid/animation/Animator;

    .line 8
    .line 9
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->m:Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->n:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->i:Ll/fsj;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/fsj;->d()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final v()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h:Ll/jjs;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jjs;->g()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowPreviewText:Z

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->d:Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 37
    .line 38
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iput v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->o:I

    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Ljava/lang/Integer;

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ljava/lang/Integer;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 80
    .line 81
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 89
    .line 90
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 98
    .line 99
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 103
    .line 104
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->d:Landroid/widget/TextView;

    .line 108
    .line 109
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 113
    .line 114
    const/high16 v1, 0x3f800000    # 1.0f

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->d:Landroid/widget/TextView;

    .line 125
    .line 126
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public w(Ll/jjs;[ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;)V
    .locals 2
    .param p3    # Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->m(Ll/jjs;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 13
    .line 14
    :cond_0
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->p:Z

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->h:Ll/jjs;

    .line 17
    .line 18
    invoke-virtual {p0, p2, p3, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->D([ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsFlyView;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final x(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->o:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v0, v2, :cond_0

    .line 7
    .line 8
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->d:Landroid/widget/TextView;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 45
    .line 46
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->A()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->o:I

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/4 v0, 0x0

    .line 48
    invoke-virtual {v2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->d:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 57
    .line 58
    invoke-virtual {v2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 62
    .line 63
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->d:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 72
    .line 73
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->c:Landroid/widget/TextView;

    .line 77
    .line 78
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Ljava/lang/Integer;

    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->e:Landroid/widget/TextView;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Ljava/lang/Integer;

    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->B()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final z()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->C()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->o:I

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->k:Landroid/animation/Animator;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->k()V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->k:Landroid/animation/Animator;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->k:Landroid/animation/Animator;

    .line 25
    .line 26
    new-instance v1, Ll/tsj;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/tsj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsProgressView;->k:Landroid/animation/Animator;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method
