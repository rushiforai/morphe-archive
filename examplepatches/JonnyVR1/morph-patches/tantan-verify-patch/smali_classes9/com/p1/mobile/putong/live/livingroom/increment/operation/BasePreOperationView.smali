.class public abstract Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/i6t;",
        ">",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public d:Ll/i6t;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;Landroid/graphics/PathMeasure;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->l0(Landroid/graphics/PathMeasure;Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public getPresenter()Ll/i6t;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TP;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->d:Ll/i6t;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTargetPos()Ll/bnl0$g;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->d:Ll/i6t;

    .line 2
    .line 3
    new-instance v1, Ll/z160;

    .line 4
    .line 5
    const/16 v2, 0x1fa4

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ll/z160;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->e:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->e:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p0, ""

    .line 24
    .line 25
    :goto_0
    invoke-virtual {v1, p0}, Ll/z160;->f(Ljava/lang/String;)Ll/z160;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Landroid/util/Pair;

    .line 34
    .line 35
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Ll/bnl0$g;

    .line 38
    .line 39
    return-object p0
.end method

.method public i0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/i6t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->j0(Ll/i6t;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j0(Ll/i6t;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->d:Ll/i6t;

    .line 2
    .line 3
    return-void
.end method

.method public k0(Ll/bnl0$g;)V
    .locals 10

    .line 1
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 2
    .line 3
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 4
    .line 5
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v8, 0x2

    .line 9
    new-array v7, v8, [F

    .line 10
    .line 11
    fill-array-data v7, :array_0

    .line 12
    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    const-wide/16 v4, -0x1

    .line 17
    .line 18
    move-object v0, p0

    .line 19
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 24
    .line 25
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 26
    .line 27
    .line 28
    new-array v7, v8, [F

    .line 29
    .line 30
    fill-array-data v7, :array_1

    .line 31
    .line 32
    .line 33
    const-string v1, "alpha"

    .line 34
    .line 35
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    move-result-object v9

    .line 39
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 40
    .line 41
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 42
    .line 43
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 44
    .line 45
    .line 46
    new-array v7, v8, [F

    .line 47
    .line 48
    fill-array-data v7, :array_2

    .line 49
    .line 50
    .line 51
    const-wide/16 v4, 0xa0

    .line 52
    .line 53
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->r0(Ll/bnl0$g;)Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const/4 v2, 0x3

    .line 62
    new-array v2, v2, [Landroid/animation/Animator;

    .line 63
    .line 64
    const/4 v3, 0x0

    .line 65
    aput-object p0, v2, v3

    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    aput-object p1, v2, p0

    .line 69
    .line 70
    aput-object v9, v2, v8

    .line 71
    .line 72
    const-wide/16 p0, 0x140

    .line 73
    .line 74
    invoke-static {p0, p1, v2}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    filled-new-array {v1, p0}, [Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    new-instance p1, Ll/tq2;

    .line 87
    .line 88
    invoke-direct {p1, v0}, Ll/tq2;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :array_0
    .array-data 4
        0x3f99999a    # 1.2f
        0x3dcccccd    # 0.1f
    .end array-data

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3f99999a    # 1.2f
    .end array-data
.end method

.method public final synthetic l0(Landroid/graphics/PathMeasure;Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [F

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p1, p2, v0, v1}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    aget p1, v0, p1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    aget p1, v0, p1

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public m0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->d:Ll/i6t;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->boostStartEnd()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/q260$a;

    .line 14
    .line 15
    const/16 v2, 0x1fa4

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ll/q260$a;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->e:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/q260$a;->a()Ll/q260;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public abstract synthetic n0(Ll/dum;)Ll/i6t;
.end method

.method public o0(Ll/q260;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    return-void
.end method

.method public p0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 14
    .line 15
    const/16 v0, 0x11

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;->c(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public q0(Ll/bnl0$g;)V
    .locals 9

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    .line 6
    .line 7
    const/4 v7, 0x1

    .line 8
    const/high16 v8, 0x3f000000    # 0.5f

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const v2, 0x3f99999a    # 1.2f

    .line 12
    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const v4, 0x3f99999a    # 1.2f

    .line 16
    .line 17
    .line 18
    const/4 v5, 0x1

    .line 19
    const/high16 v6, 0x3f000000    # 0.5f

    .line 20
    .line 21
    invoke-direct/range {v0 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Landroid/view/animation/AlphaAnimation;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    const/high16 v3, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-direct {v1, v2, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Landroid/view/animation/AnimationSet;

    .line 33
    .line 34
    invoke-direct {v2, p1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 35
    .line 36
    .line 37
    const-wide/16 v3, 0x140

    .line 38
    .line 39
    invoke-virtual {v2, v3, v4}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, p1}, Landroid/view/animation/AnimationSet;->setFillAfter(Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 49
    .line 50
    .line 51
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView$a;

    .line 52
    .line 53
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, p1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public r0(Ll/bnl0$g;)Landroid/animation/ValueAnimator;
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->getTargetPos()Ll/bnl0$g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/graphics/Path;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v1, v2, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 12
    .line 13
    .line 14
    iget v3, v0, Ll/bnl0$g;->a:I

    .line 15
    .line 16
    iget v4, p1, Ll/bnl0$g;->a:I

    .line 17
    .line 18
    sub-int v5, v3, v4

    .line 19
    .line 20
    int-to-float v5, v5

    .line 21
    const/high16 v6, 0x40000000    # 2.0f

    .line 22
    .line 23
    div-float/2addr v5, v6

    .line 24
    iget v7, v0, Ll/bnl0$g;->b:I

    .line 25
    .line 26
    iget v8, p1, Ll/bnl0$g;->b:I

    .line 27
    .line 28
    sub-int v9, v7, v8

    .line 29
    .line 30
    int-to-float v9, v9

    .line 31
    div-float/2addr v9, v6

    .line 32
    sub-int/2addr v3, v4

    .line 33
    int-to-float v3, v3

    .line 34
    iget p1, p1, Ll/bnl0$g;->c:I

    .line 35
    .line 36
    int-to-float p1, p1

    .line 37
    div-float/2addr p1, v6

    .line 38
    sub-float/2addr v3, p1

    .line 39
    iget p1, v0, Ll/bnl0$g;->c:I

    .line 40
    .line 41
    int-to-float p1, p1

    .line 42
    add-float/2addr v3, p1

    .line 43
    sub-int/2addr v7, v8

    .line 44
    int-to-float p1, v7

    .line 45
    iget v0, v0, Ll/bnl0$g;->d:I

    .line 46
    .line 47
    int-to-float v0, v0

    .line 48
    const/high16 v4, 0x3fc00000    # 1.5f

    .line 49
    .line 50
    mul-float/2addr v0, v4

    .line 51
    sub-float/2addr p1, v0

    .line 52
    invoke-virtual {v1, v5, v9, v3, p1}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 53
    .line 54
    .line 55
    new-instance p1, Landroid/graphics/PathMeasure;

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    invoke-direct {p1, v1, v0}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/graphics/PathMeasure;->getLength()F

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    const/4 v3, 0x2

    .line 66
    new-array v3, v3, [F

    .line 67
    .line 68
    aput v2, v3, v0

    .line 69
    .line 70
    const/4 v0, 0x1

    .line 71
    aput v1, v3, v0

    .line 72
    .line 73
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/uq2;

    .line 78
    .line 79
    invoke-direct {v1, p0, p1}, Ll/uq2;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;Landroid/graphics/PathMeasure;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 83
    .line 84
    .line 85
    new-instance p1, Ll/vq2;

    .line 86
    .line 87
    invoke-direct {p1, p0}, Ll/vq2;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    return-object v0
.end method

.method public setOperationPlace(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->e:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    return-void
.end method
