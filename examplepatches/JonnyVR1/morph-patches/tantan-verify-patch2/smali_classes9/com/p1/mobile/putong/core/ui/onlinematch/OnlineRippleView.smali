.class public Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static final k:I

.field public static final l:I


# instance fields
.field public a:Landroid/animation/ValueAnimator;

.field public b:Landroid/graphics/Paint;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42f40000    # 122.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->k:I

    .line 8
    .line 9
    const/high16 v0, 0x432a0000    # 170.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->l:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->k:I

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->c:I

    .line 7
    .line 8
    sget p3, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->l:I

    .line 9
    .line 10
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->d:I

    .line 11
    .line 12
    sub-int/2addr p3, p1

    .line 13
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->e:I

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->g(Landroid/util/AttributeSet;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->g:I

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->e:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->d:I

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;)Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->b:Landroid/graphics/Paint;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->g:I

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->f:I

    return-void
.end method


# virtual methods
.method public final g(Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v2, Ll/khc0;->U0:[I

    .line 13
    .line 14
    invoke-virtual {v0, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v0, Ll/khc0;->V0:I

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->j:I

    .line 25
    .line 26
    sget v0, Ll/khc0;->X0:I

    .line 27
    .line 28
    sget v2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->k:I

    .line 29
    .line 30
    int-to-float v2, v2

    .line 31
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    float-to-int v0, v0

    .line 36
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->c:I

    .line 37
    .line 38
    sget v0, Ll/khc0;->W0:I

    .line 39
    .line 40
    sget v2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->l:I

    .line 41
    .line 42
    int-to-float v2, v2

    .line 43
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    float-to-int p1, p1

    .line 48
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->d:I

    .line 49
    .line 50
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->c:I

    .line 51
    .line 52
    sub-int/2addr p1, v0

    .line 53
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->e:I

    .line 54
    .line 55
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->c:I

    .line 56
    .line 57
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->d:I

    .line 58
    .line 59
    filled-new-array {p1, v0}, [I

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->a:Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    const-wide/16 v2, 0x4b0

    .line 70
    .line 71
    invoke-virtual {p1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->a:Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    const-wide/16 v2, 0xc8

    .line 77
    .line 78
    invoke-virtual {p1, v2, v3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->a:Landroid/animation/ValueAnimator;

    .line 82
    .line 83
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView$a;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView$a;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->a:Landroid/animation/ValueAnimator;

    .line 92
    .line 93
    const/4 v0, 0x1

    .line 94
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->a:Landroid/animation/ValueAnimator;

    .line 98
    .line 99
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 100
    .line 101
    .line 102
    new-instance p1, Landroid/graphics/Paint;

    .line 103
    .line 104
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->b:Landroid/graphics/Paint;

    .line 108
    .line 109
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->j:I

    .line 110
    .line 111
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 112
    .line 113
    .line 114
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->c:I

    .line 115
    .line 116
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->f:I

    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->b:Landroid/graphics/Paint;

    .line 119
    .line 120
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->g:I

    .line 121
    .line 122
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->b:Landroid/graphics/Paint;

    .line 126
    .line 127
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public final h()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->a:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->a:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->a:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->a:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->h:I

    .line 5
    .line 6
    div-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    int-to-float v0, v0

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->i:I

    .line 10
    .line 11
    div-int/lit8 v1, v1, 0x2

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->f:I

    .line 15
    .line 16
    div-int/lit8 v2, v2, 0x2

    .line 17
    .line 18
    int-to-float v2, v2

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->b:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->h:I

    .line 9
    .line 10
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->i:I

    .line 15
    .line 16
    return-void
.end method

.method public setVisibility(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->h()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineRippleView;->i()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
