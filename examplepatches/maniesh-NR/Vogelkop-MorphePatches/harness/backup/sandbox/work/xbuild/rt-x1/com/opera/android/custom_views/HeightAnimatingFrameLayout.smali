.class public final Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;",
        "Landroid/widget/FrameLayout;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final d:J

.field public static final synthetic e:I


# instance fields
.field public a:I

.field public b:I

.field public c:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0xfa

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->d:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final onDetachedFromWindow()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object p0, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->c:Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_a
    return-void
.end method

.method public final onMeasure(II)V
    .registers 7

    const/4 p2, 0x0

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p2

    if-nez p2, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    iget v0, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->a:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p2, v0, :cond_71

    iget-object v0, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->c:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_26

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-ne v0, v2, :cond_26

    iget v0, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_27

    :cond_26
    move-object v0, v1

    :goto_27
    if-eqz v0, :cond_2f

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, p2, :cond_71

    :cond_2f
    iget v0, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->a:I

    if-eqz v0, :cond_71

    iget-object v1, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->c:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_3a

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_3a
    iput p2, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->b:I

    filled-new-array {v0, p2}, [I

    move-result-object v1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v1

    if-le p2, v0, :cond_49

    sget-object p2, Llf1;->d:Landroid/view/animation/DecelerateInterpolator;

    goto :goto_4b

    :cond_49
    sget-object p2, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    :goto_4b
    invoke-virtual {v1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    sget-wide v2, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->d:J

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance p2, Lnl2;

    const/16 v0, 0x9

    invoke-direct {p2, p0, v0}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance p2, Lkc;

    const/16 v0, 0xb

    invoke-direct {p2, p0, v0}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    iput-object v1, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->c:Landroid/animation/ValueAnimator;

    goto :goto_85

    :cond_71
    iget-object v0, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->c:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_81

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-ne v0, v2, :cond_81

    iget v0, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_81
    if-nez v1, :cond_85

    iput p2, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->a:I

    :cond_85
    :goto_85
    iget p2, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->a:I

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    iget p2, p0, Lcom/opera/android/custom_views/HeightAnimatingFrameLayout;->a:I

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
