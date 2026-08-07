.class public Ll/sfn0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:[I

.field public b:[I

.field public c:[I

.field public d:[F

.field public e:Landroid/animation/ValueAnimator;

.field public f:Landroid/animation/AnimatorSet;

.field public g:Lv/VDraweeView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

.field public i:Landroid/graphics/Path;

.field public j:Landroid/graphics/PathMeasure;

.field public k:I

.field public l:I

.field public m:Landroid/animation/Animator;

.field public n:Landroid/animation/Animator;

.field public o:Landroid/animation/ObjectAnimator;

.field public p:Z

.field public q:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/qa00;->B:I

    .line 5
    .line 6
    iput v0, p0, Ll/sfn0;->q:I

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v1, v0, [I

    .line 10
    .line 11
    iput-object v1, p0, Ll/sfn0;->c:[I

    .line 12
    .line 13
    new-array v1, v0, [F

    .line 14
    .line 15
    iput-object v1, p0, Ll/sfn0;->d:[F

    .line 16
    .line 17
    new-instance v1, Landroid/graphics/Path;

    .line 18
    .line 19
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/sfn0;->i:Landroid/graphics/Path;

    .line 23
    .line 24
    new-instance v1, Landroid/graphics/PathMeasure;

    .line 25
    .line 26
    invoke-direct {v1}, Landroid/graphics/PathMeasure;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/sfn0;->j:Landroid/graphics/PathMeasure;

    .line 30
    .line 31
    iget v1, p0, Ll/sfn0;->q:I

    .line 32
    .line 33
    div-int/lit8 v2, v1, 0x2

    .line 34
    .line 35
    iput v2, p0, Ll/sfn0;->k:I

    .line 36
    .line 37
    div-int/2addr v1, v0

    .line 38
    iput v1, p0, Ll/sfn0;->l:I

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic a(Ll/sfn0;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sfn0;->q(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/sfn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sfn0;->f()V

    return-void
.end method

.method public static bridge synthetic c(Ll/sfn0;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sfn0;->o()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic d(Ll/sfn0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sfn0;->r(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/sfn0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sfn0;->s(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V

    return-void
.end method


# virtual methods
.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sfn0;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/sfn0;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 16
    .line 17
    iget-object v1, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 23
    .line 24
    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;)V
    .locals 2

    .line 1
    new-instance v0, Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 11
    .line 12
    new-instance v0, Ll/xlj;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-direct {v0, p1}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ll/xlj;->a()Ll/wlj;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget-object v0, Ll/h1e0;->h:Ll/h1e0;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/wlj;->w(Ll/h1e0;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 36
    .line 37
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 38
    .line 39
    iget p0, p0, Ll/sfn0;->q:I

    .line 40
    .line 41
    invoke-direct {v0, p0, p0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final h([F)F
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    aget p1, p1, v0

    .line 3
    .line 4
    iget p0, p0, Ll/sfn0;->k:I

    .line 5
    .line 6
    int-to-float p0, p0

    .line 7
    sub-float/2addr p1, p0

    .line 8
    return p1
.end method

.method public final i([I)F
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    aget p1, p1, v0

    .line 3
    .line 4
    iget p0, p0, Ll/sfn0;->k:I

    .line 5
    .line 6
    sub-int/2addr p1, p0

    .line 7
    int-to-float p0, p1

    .line 8
    return p0
.end method

.method public final j([F)F
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    aget p1, p1, v0

    .line 3
    .line 4
    iget p0, p0, Ll/sfn0;->l:I

    .line 5
    .line 6
    int-to-float p0, p0

    .line 7
    sub-float/2addr p1, p0

    .line 8
    return p1
.end method

.method public final k([I)F
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    aget p1, p1, v0

    .line 3
    .line 4
    iget p0, p0, Ll/sfn0;->l:I

    .line 5
    .line 6
    sub-int/2addr p1, p0

    .line 7
    int-to-float p0, p1

    .line 8
    return p0
.end method

.method public final l()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/sfn0;->i:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sfn0;->i:Landroid/graphics/Path;

    .line 7
    .line 8
    iget-object v1, p0, Ll/sfn0;->a:[I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aget v3, v1, v2

    .line 12
    .line 13
    int-to-float v3, v3

    .line 14
    const/4 v4, 0x1

    .line 15
    aget v1, v1, v4

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    invoke-virtual {v0, v3, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/sfn0;->i:Landroid/graphics/Path;

    .line 22
    .line 23
    iget-object v1, p0, Ll/sfn0;->c:[I

    .line 24
    .line 25
    aget v3, v1, v2

    .line 26
    .line 27
    int-to-float v3, v3

    .line 28
    aget v1, v1, v4

    .line 29
    .line 30
    int-to-float v1, v1

    .line 31
    iget-object v5, p0, Ll/sfn0;->b:[I

    .line 32
    .line 33
    aget v6, v5, v2

    .line 34
    .line 35
    int-to-float v6, v6

    .line 36
    aget v4, v5, v4

    .line 37
    .line 38
    int-to-float v4, v4

    .line 39
    invoke-virtual {v0, v3, v1, v6, v4}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/sfn0;->j:Landroid/graphics/PathMeasure;

    .line 43
    .line 44
    iget-object p0, p0, Ll/sfn0;->i:Landroid/graphics/Path;

    .line 45
    .line 46
    invoke-virtual {v0, p0, v2}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->startPosition:[I

    .line 2
    .line 3
    iput-object v0, p0, Ll/sfn0;->a:[I

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->endPosition:[I

    .line 6
    .line 7
    iput-object p1, p0, Ll/sfn0;->b:[I

    .line 8
    .line 9
    iget-object p0, p0, Ll/sfn0;->c:[I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    aget v0, v0, v1

    .line 13
    .line 14
    aput v0, p0, v1

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    aget p1, p1, v0

    .line 18
    .line 19
    aput p1, p0, v0

    .line 20
    .line 21
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sfn0;->a:[I

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Ll/sfn0;->i([I)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setX(F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 13
    .line 14
    iget-object v1, p0, Ll/sfn0;->a:[I

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Ll/sfn0;->k([I)F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {v0, p0}, Landroid/view/View;->setY(F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final o()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/i9n;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "userId:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "is low  device"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "intl_fly_mic"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sfn0;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic q(Landroid/animation/ValueAnimator;)V
    .locals 3

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
    iget-object v0, p0, Ll/sfn0;->j:Landroid/graphics/PathMeasure;

    .line 12
    .line 13
    iget-object v1, p0, Ll/sfn0;->d:[F

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, p1, v1, v2}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 20
    .line 21
    iget-object v0, p0, Ll/sfn0;->d:[F

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/sfn0;->h([F)F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setX(F)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 31
    .line 32
    iget-object v0, p0, Ll/sfn0;->d:[F

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/sfn0;->j([F)F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p1, p0}, Landroid/view/View;->setY(F)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final r(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 2
    .line 3
    iget p0, p0, Ll/sfn0;->q:I

    .line 4
    .line 5
    const-string v1, "context_livingAct"

    .line 6
    .line 7
    invoke-static {v1, v0, p1, p0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/sfn0;->f:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/sfn0;->f:Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    if-nez v0, :cond_4

    .line 11
    .line 12
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/sfn0;->f:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    iget-object v0, p0, Ll/sfn0;->o:Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 25
    .line 26
    new-array v2, v1, [F

    .line 27
    .line 28
    fill-array-data v2, :array_0

    .line 29
    .line 30
    .line 31
    const-string v3, "alpha"

    .line 32
    .line 33
    invoke-static {v0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/sfn0;->o:Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    :cond_1
    iget-object v0, p0, Ll/sfn0;->o:Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    const-wide/16 v2, 0xb9

    .line 42
    .line 43
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/sfn0;->o:Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    const-wide/16 v2, 0x28a

    .line 49
    .line 50
    invoke-virtual {v0, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/sfn0;->m:Landroid/animation/Animator;

    .line 54
    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    iget-object v2, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 58
    .line 59
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 60
    .line 61
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 62
    .line 63
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 64
    .line 65
    .line 66
    new-array v9, v1, [F

    .line 67
    .line 68
    fill-array-data v9, :array_1

    .line 69
    .line 70
    .line 71
    const-wide/16 v4, 0x32

    .line 72
    .line 73
    const-wide/16 v6, 0x64

    .line 74
    .line 75
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Ll/sfn0;->m:Landroid/animation/Animator;

    .line 80
    .line 81
    :cond_2
    iget-object v0, p0, Ll/sfn0;->n:Landroid/animation/Animator;

    .line 82
    .line 83
    if-nez v0, :cond_3

    .line 84
    .line 85
    iget-object v2, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 86
    .line 87
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 88
    .line 89
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 90
    .line 91
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 92
    .line 93
    .line 94
    new-array v9, v1, [F

    .line 95
    .line 96
    fill-array-data v9, :array_2

    .line 97
    .line 98
    .line 99
    const-wide/16 v4, 0x96

    .line 100
    .line 101
    const-wide/16 v6, 0x6e

    .line 102
    .line 103
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, p0, Ll/sfn0;->n:Landroid/animation/Animator;

    .line 108
    .line 109
    :cond_3
    iget-object v0, p0, Ll/sfn0;->f:Landroid/animation/AnimatorSet;

    .line 110
    .line 111
    iget-object v1, p0, Ll/sfn0;->m:Landroid/animation/Animator;

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object v1, p0, Ll/sfn0;->n:Landroid/animation/Animator;

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-object v1, p0, Ll/sfn0;->o:Landroid/animation/ObjectAnimator;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 126
    .line 127
    .line 128
    :cond_4
    iget-object v0, p0, Ll/sfn0;->f:Landroid/animation/AnimatorSet;

    .line 129
    .line 130
    new-instance v1, Ll/sfn0$b;

    .line 131
    .line 132
    invoke-direct {v1, p0, p1}, Ll/sfn0$b;-><init>(Ll/sfn0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Ll/sfn0;->f:Landroid/animation/AnimatorSet;

    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    nop

    .line 145
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3fb33333    # 1.4f
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    :array_2
    .array-data 4
        0x3fb33333    # 1.4f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public t()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/sfn0;->p:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/sfn0;->e:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/sfn0;->e:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/sfn0;->e:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/sfn0;->f:Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/sfn0;->f:Landroid/animation/AnimatorSet;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/sfn0;->f:Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Ll/sfn0;->m:Landroid/animation/Animator;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 49
    .line 50
    .line 51
    :cond_2
    invoke-virtual {p0}, Ll/sfn0;->f()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/sfn0;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;ILcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;)V
    .locals 4

    .line 1
    iput-object p3, p0, Ll/sfn0;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 2
    .line 3
    if-lez p2, :cond_0

    .line 4
    .line 5
    iput p2, p0, Ll/sfn0;->q:I

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Ll/sfn0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p3}, Ll/sfn0;->g(Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    new-array v2, v1, [Landroid/view/View;

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    aput-object v0, v2, v3

    .line 24
    .line 25
    invoke-static {p2, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 29
    .line 30
    invoke-static {v0, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x2

    .line 34
    div-int/2addr p2, v0

    .line 35
    iput p2, p0, Ll/sfn0;->k:I

    .line 36
    .line 37
    iput p2, p0, Ll/sfn0;->l:I

    .line 38
    .line 39
    iget-object p2, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    if-eqz p2, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/sfn0;->f()V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p2, p0, Ll/sfn0;->g:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-virtual {p3, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->startEffectIcon:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0, p2}, Ll/sfn0;->r(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/sfn0;->n()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/sfn0;->l()V

    .line 64
    .line 65
    .line 66
    iget-object p2, p0, Ll/sfn0;->e:Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    iget-object p3, p0, Ll/sfn0;->j:Landroid/graphics/PathMeasure;

    .line 69
    .line 70
    const/4 v2, 0x0

    .line 71
    if-nez p2, :cond_3

    .line 72
    .line 73
    invoke-virtual {p3}, Landroid/graphics/PathMeasure;->getLength()F

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    new-array p3, v0, [F

    .line 78
    .line 79
    aput v2, p3, v3

    .line 80
    .line 81
    aput p2, p3, v1

    .line 82
    .line 83
    invoke-static {p3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    iput-object p2, p0, Ll/sfn0;->e:Landroid/animation/ValueAnimator;

    .line 88
    .line 89
    new-instance p3, Landroid/view/animation/LinearInterpolator;

    .line 90
    .line 91
    invoke-direct {p3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Ll/sfn0;->e:Landroid/animation/ValueAnimator;

    .line 98
    .line 99
    const-wide/16 v0, 0x1f4

    .line 100
    .line 101
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_3
    invoke-virtual {p3}, Landroid/graphics/PathMeasure;->getLength()F

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    new-array v0, v0, [F

    .line 110
    .line 111
    aput v2, v0, v3

    .line 112
    .line 113
    aput p3, v0, v1

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 116
    .line 117
    .line 118
    :goto_0
    iget-object p2, p0, Ll/sfn0;->e:Landroid/animation/ValueAnimator;

    .line 119
    .line 120
    invoke-virtual {p2}, Landroid/animation/Animator;->removeAllListeners()V

    .line 121
    .line 122
    .line 123
    iget-object p2, p0, Ll/sfn0;->e:Landroid/animation/ValueAnimator;

    .line 124
    .line 125
    new-instance p3, Ll/rfn0;

    .line 126
    .line 127
    invoke-direct {p3, p0}, Ll/rfn0;-><init>(Ll/sfn0;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 131
    .line 132
    .line 133
    iget-object p2, p0, Ll/sfn0;->e:Landroid/animation/ValueAnimator;

    .line 134
    .line 135
    new-instance p3, Ll/sfn0$a;

    .line 136
    .line 137
    invoke-direct {p3, p0, p1}, Ll/sfn0$a;-><init>(Ll/sfn0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2, p3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Ll/sfn0;->e:Landroid/animation/ValueAnimator;

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 146
    .line 147
    .line 148
    return-void
.end method
