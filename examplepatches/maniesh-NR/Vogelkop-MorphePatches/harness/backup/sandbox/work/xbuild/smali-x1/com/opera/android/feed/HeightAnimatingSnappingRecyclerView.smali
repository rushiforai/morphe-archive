.class public final Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;
.super Lcom/opera/android/startpage/common/SnappingRecyclerView;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001B\u001b\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;",
        "Lcom/opera/android/startpage/common/SnappingRecyclerView;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
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
.field public static final J0:J

.field public static final synthetic K0:I


# instance fields
.field public G0:I

.field public H0:I

.field public I0:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0xfa

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->J0:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/opera/android/startpage/common/SnappingRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final C0(Landroidx/recyclerview/widget/f;)V
    .registers 3

    if-eqz p1, :cond_6

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/f;->setMeasurementCacheEnabled(Z)V

    :cond_6
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 1

    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->onDetachedFromWindow()V

    iget-object p0, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->I0:Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_a
    return-void
.end method

.method public final onMeasure(II)V
    .registers 7

    const/4 p2, 0x0

    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->onMeasure(II)V

    iget-boolean p2, p0, Landroidx/recyclerview/widget/RecyclerView;->s:Z

    if-nez p2, :cond_9

    return-void

    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    iget v0, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->G0:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p2, v0, :cond_6f

    iget-object v0, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->I0:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-ne v0, v2, :cond_24

    iget v0, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->H0:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_25

    :cond_24
    move-object v0, v1

    :goto_25
    if-eqz v0, :cond_2d

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, p2, :cond_6f

    :cond_2d
    iget v0, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->G0:I

    if-eqz v0, :cond_6f

    iget-object v1, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->I0:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_38

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_38
    iput p2, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->H0:I

    filled-new-array {v0, p2}, [I

    move-result-object v1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v1

    if-le p2, v0, :cond_47

    sget-object p2, Llf1;->d:Landroid/view/animation/DecelerateInterpolator;

    goto :goto_49

    :cond_47
    sget-object p2, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    :goto_49
    invoke-virtual {v1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    sget-wide v2, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->J0:J

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance p2, Lnl2;

    const/16 v0, 0xa

    invoke-direct {p2, p0, v0}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance p2, Lkc;

    const/16 v0, 0xc

    invoke-direct {p2, p0, v0}, Lkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    iput-object v1, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->I0:Landroid/animation/ValueAnimator;

    goto :goto_83

    :cond_6f
    iget-object v0, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->I0:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_7f

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-ne v0, v2, :cond_7f

    iget v0, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->H0:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_7f
    if-nez v1, :cond_83

    iput p2, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->G0:I

    :cond_83
    :goto_83
    iget p2, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->G0:I

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    iget p2, p0, Lcom/opera/android/feed/HeightAnimatingSnappingRecyclerView;->G0:I

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
