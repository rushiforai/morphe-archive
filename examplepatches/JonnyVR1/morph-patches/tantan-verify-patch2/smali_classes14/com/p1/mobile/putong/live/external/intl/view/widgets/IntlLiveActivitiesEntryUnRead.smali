.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;
.super Lv/VRelative;
.source "SourceFile"

# interfaces
.implements Ll/ftn;


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VMarqueeText;

.field public f:Lv/VText;

.field public g:Lv/VFrame;

.field public h:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->h:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method private L()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->h:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->h:Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private synthetic P(IILandroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    const/high16 v0, 0x40000000    # 2.0f

    .line 6
    .line 7
    mul-float/2addr v0, p3

    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 15
    .line 16
    neg-int p1, p1

    .line 17
    int-to-float p1, p1

    .line 18
    mul-float/2addr p1, p3

    .line 19
    invoke-virtual {v2, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 23
    .line 24
    neg-int p2, p2

    .line 25
    int-to-float p2, p2

    .line 26
    mul-float/2addr p2, p3

    .line 27
    invoke-virtual {v2, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 31
    .line 32
    sub-float p3, v1, p3

    .line 33
    .line 34
    invoke-virtual {v2, p3}, Landroid/view/View;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 38
    .line 39
    invoke-virtual {v2, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 43
    .line 44
    invoke-virtual {v2, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 48
    .line 49
    invoke-virtual {v2, p3}, Landroid/view/View;->setAlpha(F)V

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {v2, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {v2, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {v2, p3}, Landroid/view/View;->setAlpha(F)V

    .line 65
    .line 66
    .line 67
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 68
    .line 69
    invoke-virtual {p3, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 73
    .line 74
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 78
    .line 79
    sub-float/2addr v1, v0

    .line 80
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;IILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->P(IILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;IILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->M(IILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->O(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zun;->a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final I(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final synthetic M(IILandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 6
    .line 7
    neg-int p1, p1

    .line 8
    int-to-float p1, p1

    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    sub-float/2addr v1, p3

    .line 12
    mul-float/2addr p1, v1

    .line 13
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 17
    .line 18
    neg-int p2, p2

    .line 19
    int-to-float p2, p2

    .line 20
    mul-float/2addr p2, v1

    .line 21
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 30
    .line 31
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 55
    .line 56
    invoke-virtual {p1, p3}, Landroid/view/View;->setAlpha(F)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 60
    .line 61
    invoke-virtual {p1, p3}, Landroid/view/View;->setAlpha(F)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {p0, p3}, Landroid/view/View;->setAlpha(F)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic O(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Ll/qrr;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->unread:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f:Lv/VText;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->subtitle:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->I(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const-string p2, "context_square"

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 28
    .line 29
    invoke-static {p2, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public a()I
    .locals 0

    .line 1
    const p0, -0x16300

    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    const p0, -0x5a6c6

    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public i()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s(Ll/ftn;)Landroid/animation/Animator;
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->L()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/ftn;->e()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int/2addr v0, v1

    .line 13
    invoke-interface {p1}, Ll/ftn;->f()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sub-int/2addr p1, v1

    .line 22
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    new-array v3, v2, [F

    .line 29
    .line 30
    fill-array-data v3, :array_0

    .line 31
    .line 32
    .line 33
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    new-instance v4, Ll/wun;

    .line 38
    .line 39
    invoke-direct {v4, p0, v0, p1}, Ll/wun;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;II)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 43
    .line 44
    .line 45
    const-wide/16 v4, 0x320

    .line 46
    .line 47
    invoke-virtual {v3, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    new-array v4, v2, [F

    .line 51
    .line 52
    fill-array-data v4, :array_1

    .line 53
    .line 54
    .line 55
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    new-instance v5, Ll/xun;

    .line 60
    .line 61
    invoke-direct {v5, p0}, Ll/xun;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 65
    .line 66
    .line 67
    const-wide/16 v5, 0x258

    .line 68
    .line 69
    invoke-virtual {v4, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    .line 72
    const-wide/16 v5, 0xc8

    .line 73
    .line 74
    invoke-virtual {v4, v5, v6}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 75
    .line 76
    .line 77
    new-array v2, v2, [Landroid/animation/Animator;

    .line 78
    .line 79
    const/4 v5, 0x0

    .line 80
    aput-object v3, v2, v5

    .line 81
    .line 82
    const/4 v3, 0x1

    .line 83
    aput-object v4, v2, v3

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 86
    .line 87
    .line 88
    new-instance v2, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$a;

    .line 89
    .line 90
    invoke-direct {v2, p0, v0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;II)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 94
    .line 95
    .line 96
    return-object v1

    .line 97
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public setOnCloseButtonClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Ll/ftn;)Landroid/animation/Animator;
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->L()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/ftn;->e()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int/2addr v0, v1

    .line 13
    invoke-interface {p1}, Ll/ftn;->f()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sub-int/2addr p1, v1

    .line 22
    const/4 v1, 0x2

    .line 23
    new-array v1, v1, [F

    .line 24
    .line 25
    fill-array-data v1, :array_0

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/yun;

    .line 33
    .line 34
    invoke-direct {v2, p0, v0, p1}, Ll/yun;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;II)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 46
    .line 47
    .line 48
    const-wide/16 p0, 0x320

    .line 49
    .line 50
    invoke-virtual {v1, p0, p1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    return-object v1

    .line 54
    nop

    .line 55
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
