.class public Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Ll/jxd0;

.field public c:Landroid/animation/ValueAnimator;

.field public d:Landroid/animation/ValueAnimator;

.field public e:Z

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    const-string v0, "has_show_undo_tip_in_card"

    .line 7
    .line 8
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->b:Ll/jxd0;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->e:Z

    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->f:Z

    .line 24
    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->g:Z

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 28
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    new-instance p1, Ll/jxd0;

    const-string p2, "has_show_undo_tip_in_card"

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->b:Ll/jxd0;

    const/4 p1, 0x0

    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d:Landroid/animation/ValueAnimator;

    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->e:Z

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->f:Z

    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->g:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    new-instance p1, Ll/jxd0;

    const-string p2, "has_show_undo_tip_in_card"

    sget-object p3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2, p3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->b:Ll/jxd0;

    const/4 p1, 0x0

    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d:Landroid/animation/ValueAnimator;

    const/4 p1, 0x0

    .line 39
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->e:Z

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->f:Z

    .line 41
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->g:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->f(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(F)F
    .locals 5

    .line 1
    float-to-double v0, p0

    .line 2
    const-wide v2, 0x3fe570a3d70a3d71L    # 0.67

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    cmpg-double v0, v0, v2

    .line 8
    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    const v0, 0x3f2b851f    # 0.67f

    .line 14
    .line 15
    .line 16
    sub-float/2addr p0, v0

    .line 17
    const/high16 v0, 0x40400000    # 3.0f

    .line 18
    .line 19
    mul-float/2addr p0, v0

    .line 20
    const/high16 v0, 0x3f800000    # 1.0f

    .line 21
    .line 22
    sub-float/2addr v0, p0

    .line 23
    float-to-double v0, v0

    .line 24
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 25
    .line 26
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    double-to-float v0, v0

    .line 31
    const-wide v1, 0x403921fb54442d18L    # 25.132741228718345

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    float-to-double v3, p0

    .line 37
    mul-double/2addr v3, v1

    .line 38
    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    double-to-float p0, v1

    .line 43
    mul-float/2addr v0, p0

    .line 44
    return v0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->g:Z

    return p0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zwl0;->a(Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final synthetic f(Landroid/animation/ValueAnimator;)V
    .locals 0

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
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final g()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->a:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v1, v1, [F

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    const-string v2, "rotation"

    .line 10
    .line 11
    invoke-static {v0, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    new-instance v1, Ll/ywl0;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/ywl0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    const-wide/16 v1, 0x5dc

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d:Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    const/4 v1, -0x1

    .line 35
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    nop

    .line 45
    :array_0
    .array-data 4
        0x0
        0x41f00000    # 30.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->g:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    if-nez p2, :cond_3

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    :goto_0
    return-void

    .line 18
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->e()V

    .line 19
    .line 20
    .line 21
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->f:Z

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    const/high16 p2, 0x41c80000    # 25.0f

    .line 30
    .line 31
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    int-to-float p2, p2

    .line 36
    invoke-virtual {p0, p2}, Landroid/view/View;->setPivotX(F)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/view/View;->setPivotY(F)V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x2

    .line 43
    new-array p1, p1, [F

    .line 44
    .line 45
    fill-array-data p1, :array_0

    .line 46
    .line 47
    .line 48
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    const-wide/16 v0, 0x1f4

    .line 55
    .line 56
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    sget-object p2, Lcom/sunshine/engine/base/InterpolatorType;->overshoot:Lcom/sunshine/engine/base/InterpolatorType;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/sunshine/engine/base/InterpolatorType;->obtain()Landroid/view/animation/Interpolator;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    new-instance p2, Ll/xwl0;

    .line 73
    .line 74
    invoke-direct {p2, p0}, Ll/xwl0;-><init>(Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 81
    .line 82
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip$a;

    .line 83
    .line 84
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 91
    .line 92
    const-wide/16 v0, 0x12c

    .line 93
    .line 94
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->c:Landroid/animation/ValueAnimator;

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 100
    .line 101
    .line 102
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->g()V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_3
    const/4 p1, 0x0

    .line 107
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->f:Z

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/VipUndoTip;->e()V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
