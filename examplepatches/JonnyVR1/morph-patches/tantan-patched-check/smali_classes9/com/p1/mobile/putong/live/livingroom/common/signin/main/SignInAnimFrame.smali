.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final g:I


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/FrameLayout;

.field public final c:Landroid/widget/FrameLayout$LayoutParams;

.field public d:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public f:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41c80000    # 25.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    neg-int v0, v0

    .line 8
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->g:I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 5
    .line 6
    const/high16 p2, 0x42e80000    # 116.0f

    .line 7
    .line 8
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/high16 v0, 0x431b0000    # 155.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-direct {p1, p2, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->c:Landroid/widget/FrameLayout$LayoutParams;

    .line 22
    .line 23
    new-instance p2, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->e:Ljava/util/List;

    .line 29
    .line 30
    new-instance p2, Landroid/os/Handler;

    .line 31
    .line 32
    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->f:Landroid/os/Handler;

    .line 36
    .line 37
    const/16 p0, 0x11

    .line 38
    .line 39
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;ILjava/util/Map;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->m(ILjava/util/Map;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;FLcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;FFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->n(FLcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;FFLandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/animation/Animator;->isRunning()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 8
    .line 9
    .line 10
    const-string p0, "[live]sign_in"

    .line 11
    .line 12
    const-string v0, "Cancel one running animation"

    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->l()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->o(I)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->e:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;)Lcom/p1/mobile/putong/live/livingroom/common/signin/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->d:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    return-object p0
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/saf0;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->d:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Going to cancel all running animation, mAnimList.size = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->e:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "[live]sign_in"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->f:Landroid/os/Handler;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->e:Ljava/util/List;

    .line 33
    .line 34
    new-instance v0, Ll/naf0;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/naf0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final k(Ll/x20;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-instance v1, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    new-array v2, v2, [F

    .line 14
    .line 15
    fill-array-data v2, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-wide/16 v3, 0x12c

    .line 23
    .line 24
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    .line 28
    .line 29
    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 33
    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    :goto_0
    if-ge v3, v0, :cond_0

    .line 37
    .line 38
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;

    .line 45
    .line 46
    invoke-virtual {v4}, Landroid/view/View;->getTranslationX()F

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    add-int/lit8 v3, v3, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    new-instance v3, Ll/raf0;

    .line 61
    .line 62
    invoke-direct {v3, p0, v0, v1}, Ll/raf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;ILjava/util/Map;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;

    .line 69
    .line 70
    invoke-direct {v1, p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;ILl/x20;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->e:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final l()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    div-int/2addr v0, v1

    .line 9
    const/high16 v2, 0x41c80000    # 25.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    sub-int/2addr v0, v2

    .line 16
    int-to-float v4, v0

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    div-int/2addr v0, v1

    .line 24
    sget v2, Ll/qa00;->o:I

    .line 25
    .line 26
    sub-int/2addr v0, v2

    .line 27
    int-to-float v6, v0

    .line 28
    const/high16 v0, 0x40800000    # 4.0f

    .line 29
    .line 30
    mul-float/2addr v0, v4

    .line 31
    const-wide v2, 0x401921fb54442d18L    # 6.283185307179586

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    float-to-double v7, v0

    .line 37
    div-double/2addr v2, v7

    .line 38
    double-to-float v7, v2

    .line 39
    new-array v0, v1, [F

    .line 40
    .line 41
    fill-array-data v0, :array_0

    .line 42
    .line 43
    .line 44
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-wide/16 v1, 0x1f4

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    .line 54
    .line 55
    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 68
    .line 69
    add-int/lit8 v3, v1, -0x1

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    move-object v5, v2

    .line 76
    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;

    .line 77
    .line 78
    if-nez v5, :cond_0

    .line 79
    .line 80
    new-instance p0, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string v0, "Can no fly, childCount = "

    .line 83
    .line 84
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    const-string v0, "[live]sign_in"

    .line 95
    .line 96
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 100
    .line 101
    const-string v0, "View port has no child"

    .line 102
    .line 103
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_0
    new-instance v2, Ll/qaf0;

    .line 111
    .line 112
    move-object v3, p0

    .line 113
    invoke-direct/range {v2 .. v7}, Ll/qaf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;FLcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;FF)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 117
    .line 118
    .line 119
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$a;

    .line 120
    .line 121
    invoke-direct {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 128
    .line 129
    .line 130
    iget-object p0, v3, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->e:Ljava/util/List;

    .line 131
    .line 132
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    nop

    .line 137
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic m(ILjava/util/Map;Landroid/animation/ValueAnimator;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p1, :cond_1

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;

    .line 11
    .line 12
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Ljava/lang/Float;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/high16 v4, 0x3f800000    # 1.0f

    .line 27
    .line 28
    sub-float v3, v4, v3

    .line 29
    .line 30
    mul-float/2addr v2, v3

    .line 31
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 32
    .line 33
    .line 34
    add-int/lit8 v2, p1, -0x1

    .line 35
    .line 36
    if-eq v0, v2, :cond_0

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;->a:Lv/VImage;

    .line 39
    .line 40
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    sub-float/2addr v4, v2

    .line 45
    invoke-virtual {v1, v4}, Landroid/view/View;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    return-void
.end method

.method public final synthetic n(FLcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;FFLandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p5}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    mul-float/2addr p1, p5

    .line 6
    invoke-virtual {p2, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 7
    .line 8
    .line 9
    neg-float p3, p3

    .line 10
    float-to-double v0, p3

    .line 11
    mul-float/2addr p4, p1

    .line 12
    float-to-double p3, p4

    .line 13
    invoke-static {p3, p4}, Ljava/lang/Math;->sin(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide p3

    .line 17
    mul-double/2addr v0, p3

    .line 18
    double-to-float p1, v0

    .line 19
    invoke-virtual {p2, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 20
    .line 21
    .line 22
    const/high16 p1, 0x43340000    # 180.0f

    .line 23
    .line 24
    mul-float/2addr p1, p5

    .line 25
    invoke-virtual {p2, p1}, Landroid/view/View;->setRotation(F)V

    .line 26
    .line 27
    .line 28
    const p1, 0x3f666666    # 0.9f

    .line 29
    .line 30
    .line 31
    mul-float/2addr p1, p5

    .line 32
    const/high16 p3, 0x3f800000    # 1.0f

    .line 33
    .line 34
    sub-float p1, p3, p1

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleX(F)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleY(F)V

    .line 40
    .line 41
    .line 42
    const p1, 0x3f4ccccd    # 0.8f

    .line 43
    .line 44
    .line 45
    mul-float/2addr p1, p5

    .line 46
    sub-float p1, p3, p1

    .line 47
    .line 48
    invoke-virtual {p2, p1}, Landroid/view/View;->setAlpha(F)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->a:Landroid/widget/FrameLayout;

    .line 52
    .line 53
    sub-float/2addr p3, p5

    .line 54
    invoke-virtual {p0, p3}, Landroid/view/View;->setAlpha(F)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic o(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-le p1, v0, :cond_0

    .line 3
    .line 4
    new-instance p1, Ll/paf0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/paf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->k(Ll/x20;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->l()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->j()V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "render rewards size: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "[live]sign_in"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->j()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->a:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    const/high16 v2, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->a:Landroid/widget/FrameLayout;

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-virtual {v0, v2}, Landroid/view/View;->setClickable(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->a:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/lit8 v3, v0, -0x1

    .line 50
    .line 51
    :goto_0
    if-ltz v3, :cond_1

    .line 52
    .line 53
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    sget v6, Ll/yec0;->D5:I

    .line 64
    .line 65
    const/4 v7, 0x0

    .line 66
    invoke-static {v5, v6, v7}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;

    .line 71
    .line 72
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 73
    .line 74
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->c:Landroid/widget/FrameLayout$LayoutParams;

    .line 75
    .line 76
    invoke-virtual {v6, v5, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    new-instance v6, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string v7, "View port child count after addView: "

    .line 82
    .line 83
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 87
    .line 88
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    invoke-static {v1, v6}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;->icon:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v5, v4}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;->b(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    if-le v0, v2, :cond_0

    .line 108
    .line 109
    invoke-virtual {p0, v5, v0, v3}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->q(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;II)V

    .line 110
    .line 111
    .line 112
    :cond_0
    add-int/lit8 v3, v3, -0x1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->f:Landroid/os/Handler;

    .line 116
    .line 117
    new-instance v1, Ll/oaf0;

    .line 118
    .line 119
    invoke-direct {v1, p0, v0}, Ll/oaf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;I)V

    .line 120
    .line 121
    .line 122
    const-wide/16 v2, 0x7d0

    .line 123
    .line 124
    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;II)V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->g:I

    .line 2
    .line 3
    add-int/lit8 v1, p2, -0x1

    .line 4
    .line 5
    mul-int/2addr v1, v0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->c:Landroid/widget/FrameLayout$LayoutParams;

    .line 7
    .line 8
    iget p0, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 9
    .line 10
    mul-int/2addr p2, p0

    .line 11
    add-int/2addr v1, p2

    .line 12
    div-int/lit8 v1, v1, 0x2

    .line 13
    .line 14
    div-int/lit8 p2, p0, 0x2

    .line 15
    .line 16
    sub-int/2addr v1, p2

    .line 17
    add-int/2addr v0, p0

    .line 18
    mul-int/2addr p3, v0

    .line 19
    sub-int/2addr p3, v1

    .line 20
    int-to-float p0, p3

    .line 21
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
