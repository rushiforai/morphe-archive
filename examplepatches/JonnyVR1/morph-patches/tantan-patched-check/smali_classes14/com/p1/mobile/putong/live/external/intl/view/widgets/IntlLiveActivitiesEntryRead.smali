.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;
.super Lv/VRelative;
.source "SourceFile"

# interfaces
.implements Ll/ftn;


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VMarqueeText;

.field public f:Lv/VText;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/animation/Animator;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Ll/kcg0;

.field public j:I

.field public k:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->g:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->j:I

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;IILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->P(IILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->k:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;IILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->O(IILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->Q(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->R()V

    return-void
.end method


# virtual methods
.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tun;->a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->h:Landroid/animation/Animator;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->j:I

    .line 15
    .line 16
    return-void
.end method

.method public final M()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->k:Landroid/graphics/drawable/Drawable;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->k:Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic O(IILandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->e:Lv/VMarqueeText;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->e:Lv/VMarqueeText;

    .line 30
    .line 31
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->f:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->f:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

    .line 45
    .line 46
    invoke-virtual {p1, p3}, Landroid/view/View;->setAlpha(F)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->e:Lv/VMarqueeText;

    .line 50
    .line 51
    invoke-virtual {p1, p3}, Landroid/view/View;->setAlpha(F)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->f:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {p0, p3}, Landroid/view/View;->setAlpha(F)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic P(IILandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

    .line 6
    .line 7
    neg-int p1, p1

    .line 8
    int-to-float p1, p1

    .line 9
    mul-float/2addr p1, p3

    .line 10
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

    .line 14
    .line 15
    neg-int p2, p2

    .line 16
    int-to-float p2, p2

    .line 17
    mul-float/2addr p2, p3

    .line 18
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

    .line 22
    .line 23
    const/high16 v1, 0x3f800000    # 1.0f

    .line 24
    .line 25
    sub-float/2addr v1, p3

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->e:Lv/VMarqueeText;

    .line 30
    .line 31
    invoke-virtual {p3, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 32
    .line 33
    .line 34
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->e:Lv/VMarqueeText;

    .line 35
    .line 36
    invoke-virtual {p3, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 37
    .line 38
    .line 39
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->e:Lv/VMarqueeText;

    .line 40
    .line 41
    invoke-virtual {p3, v1}, Landroid/view/View;->setAlpha(F)V

    .line 42
    .line 43
    .line 44
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->f:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p3, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->f:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->f:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic Q(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->h:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->h:Landroid/animation/Animator;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final R()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->j:I

    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->g:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    rem-int/2addr v0, v1

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->j:I

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->g:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/String;

    .line 32
    .line 33
    const/high16 v0, 0x42140000    # 37.0f

    .line 34
    .line 35
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/high16 v2, 0x42380000    # 46.0f

    .line 40
    .line 41
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const-string v3, "context_square"

    .line 46
    .line 47
    invoke-static {v3, v1, p0, v0, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public S(Lcom/p1/mobile/android/app/Act;)V
    .locals 10

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->g:Ljava/util/List;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/String;

    .line 14
    .line 15
    const/high16 v2, 0x42140000    # 37.0f

    .line 16
    .line 17
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/high16 v3, 0x42380000    # 46.0f

    .line 22
    .line 23
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const-string v4, "context_square"

    .line 28
    .line 29
    invoke-static {v4, v0, v1, v2, v3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->h:Landroid/animation/Animator;

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

    .line 37
    .line 38
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 39
    .line 40
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x2

    .line 44
    new-array v8, v0, [F

    .line 45
    .line 46
    fill-array-data v8, :array_0

    .line 47
    .line 48
    .line 49
    const-string v2, "alpha"

    .line 50
    .line 51
    const-wide/16 v3, 0x0

    .line 52
    .line 53
    const-wide/16 v5, 0xc8

    .line 54
    .line 55
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

    .line 60
    .line 61
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 62
    .line 63
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 64
    .line 65
    .line 66
    new-array v9, v0, [F

    .line 67
    .line 68
    fill-array-data v9, :array_1

    .line 69
    .line 70
    .line 71
    const-string v3, "alpha"

    .line 72
    .line 73
    const-wide/16 v4, 0x0

    .line 74
    .line 75
    const-wide/16 v6, 0xc8

    .line 76
    .line 77
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v2, Ll/qun;

    .line 82
    .line 83
    invoke-direct {v2, p0}, Ll/qun;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const/16 v2, 0x7d0

    .line 91
    .line 92
    invoke-static {v2}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    filled-new-array {v0, v1, v2}, [Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->h:Landroid/animation/Animator;

    .line 105
    .line 106
    :cond_1
    const-wide/16 v0, 0x96a

    .line 107
    .line 108
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 109
    .line 110
    const-wide/16 v3, 0x0

    .line 111
    .line 112
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    new-instance v0, Ll/run;

    .line 133
    .line 134
    invoke-direct {v0, p0}, Ll/run;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->i:Ll/kcg0;

    .line 146
    .line 147
    return-void

    .line 148
    nop

    .line 149
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public T(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Ll/oun;Ll/qrr;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->L()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->read:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "\n"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    array-length v1, v0

    .line 15
    const/4 v2, 0x0

    .line 16
    if-lez v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->e:Lv/VMarqueeText;

    .line 19
    .line 20
    aget-object v3, v0, v2

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->e:Lv/VMarqueeText;

    .line 26
    .line 27
    aget-object v3, v0, v2

    .line 28
    .line 29
    invoke-virtual {v1, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->f:Lv/VText;

    .line 33
    .line 34
    array-length v3, v0

    .line 35
    add-int/lit8 v3, v3, -0x1

    .line 36
    .line 37
    aget-object v0, v0, v3

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {p2}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, p1, p3, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->V(Ljava/util/List;Ll/qrr;Lcom/p1/mobile/android/app/Act;)V

    .line 49
    .line 50
    .line 51
    const-string p0, "unknown_"

    .line 52
    .line 53
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p2, p0, v2}, Ll/oun;->D3(Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final V(Ljava/util/List;Ll/qrr;Lcom/p1/mobile/android/app/Act;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/qrr;",
            "Lcom/p1/mobile/android/app/Act;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_3

    .line 11
    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p2}, Ll/qrr;->i()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->g:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p2}, Ll/qrr;->f()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->g:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    const/4 p2, 0x2

    .line 37
    if-lt p1, p2, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->g:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->d:Lv/VDraweeView;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->g:Ljava/util/List;

    .line 54
    .line 55
    const/4 p2, 0x0

    .line 56
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Ljava/lang/String;

    .line 61
    .line 62
    const/high16 p2, 0x42140000    # 37.0f

    .line 63
    .line 64
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    const/high16 p3, 0x42380000    # 46.0f

    .line 69
    .line 70
    invoke-static {p3}, Ll/bnl0;->w(F)I

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    const-string v0, "context_square"

    .line 75
    .line 76
    invoke-static {v0, p1, p0, p2, p3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    :cond_3
    :goto_0
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

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->L()V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->I(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s(Ll/ftn;)Landroid/animation/Animator;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->M()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/ftn;->e()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->e()I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->f()I

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
    new-array v2, v2, [F

    .line 29
    .line 30
    fill-array-data v2, :array_0

    .line 31
    .line 32
    .line 33
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    new-instance v3, Ll/sun;

    .line 38
    .line 39
    invoke-direct {v3, p0, v0, p1}, Ll/sun;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;II)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 43
    .line 44
    .line 45
    const-wide/16 v3, 0x320

    .line 46
    .line 47
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    new-array v3, v3, [Landroid/animation/Animator;

    .line 52
    .line 53
    const/4 v4, 0x0

    .line 54
    aput-object v2, v3, v4

    .line 55
    .line 56
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 57
    .line 58
    .line 59
    new-instance v2, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead$a;

    .line 60
    .line 61
    invoke-direct {v2, p0, v0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;II)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 65
    .line 66
    .line 67
    return-object v1

    .line 68
    nop

    .line 69
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public v(Ll/ftn;)Landroid/animation/Animator;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->M()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/ftn;->e()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->e()I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;->f()I

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
    new-instance v2, Ll/pun;

    .line 33
    .line 34
    invoke-direct {v2, p0, v0, p1}, Ll/pun;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;II)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead$b;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead$b;-><init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryRead;)V

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
