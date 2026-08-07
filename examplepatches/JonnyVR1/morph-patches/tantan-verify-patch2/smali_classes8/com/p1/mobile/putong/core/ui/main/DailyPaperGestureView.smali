.class public Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Landroid/animation/ObjectAnimator;

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x41700000    # 15.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->c:I

    .line 11
    .line 12
    const/high16 p1, 0x42860000    # 67.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->d:I

    .line 19
    .line 20
    const/high16 p1, 0x42400000    # 48.0f

    .line 21
    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->e:I

    .line 27
    .line 28
    const/16 p1, 0x3e8

    .line 29
    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->f:I

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->c:I

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    mul-int/2addr v1, v2

    .line 9
    sub-int/2addr v0, v1

    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->d:I

    .line 11
    .line 12
    mul-int/2addr v1, v2

    .line 13
    sub-int/2addr v0, v1

    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->e:I

    .line 15
    .line 16
    sub-int/2addr v0, v1

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->a:Landroid/widget/ImageView;

    .line 18
    .line 19
    int-to-float v0, v0

    .line 20
    new-array v2, v2, [F

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    const/4 v4, 0x0

    .line 24
    aput v3, v2, v4

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    aput v0, v2, v3

    .line 28
    .line 29
    const-string v0, "translationX"

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->b:Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    const-wide/16 v1, 0x3e8

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->b:Landroid/animation/ObjectAnimator;

    .line 43
    .line 44
    const/4 v1, -0x1

    .line 45
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->b:Landroid/animation/ObjectAnimator;

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->b:Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->b:Landroid/animation/ObjectAnimator;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->b:Landroid/animation/ObjectAnimator;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->M4:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/ImageView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->a:Landroid/widget/ImageView;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/DailyPaperGestureView;->a()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
