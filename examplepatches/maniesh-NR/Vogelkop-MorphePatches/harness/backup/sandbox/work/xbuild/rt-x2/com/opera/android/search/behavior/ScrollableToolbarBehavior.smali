.class public final Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;
.super Lcom/opera/android/search/behavior/ViewOffsetBehavior;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/opera/android/search/behavior/ViewOffsetBehavior<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\tB\u001d\u0008\u0007\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;",
        "Lcom/opera/android/search/behavior/ViewOffsetBehavior;",
        "Landroid/view/View;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "b8h",
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
.field public static final f:J

.field public static final g:Landroid/view/animation/DecelerateInterpolator;


# instance fields
.field public c:Z

.field public final d:Z

.field public e:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x78

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->f:J

    sget-object v0, Llf1;->c:Landroid/view/animation/DecelerateInterpolator;

    sput-object v0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->g:Landroid/view/animation/DecelerateInterpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 11
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/opera/android/search/behavior/ViewOffsetBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->d:Z

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_5

    const/4 p2, 0x0

    :cond_5
    invoke-direct {p0, p1, p2}, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final g(Lqv5;)V
    .registers 2

    iget p1, p1, Lqv5;->c:I

    and-int/lit8 p1, p1, 0x50

    if-nez p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    iput-boolean p1, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->c:Z

    return-void
.end method

.method public final p(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[II)V
    .registers 8

    if-eqz p5, :cond_37

    iget-object p1, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->e:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    :cond_9
    iget-object p1, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    const/4 p3, 0x0

    if-eqz p1, :cond_11

    iget p1, p1, Lr05;->d:I

    goto :goto_12

    :cond_11
    move p1, p3

    :goto_12
    sub-int p4, p1, p5

    invoke-virtual {p0, p2}, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->z(Landroid/view/View;)I

    move-result p5

    invoke-virtual {p0, p2}, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->y(Landroid/view/View;)I

    move-result p2

    invoke-static {p4, p5, p2}, Ldjh;->c(III)I

    move-result p2

    if-eq p1, p2, :cond_34

    iget-object p3, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    if-eqz p3, :cond_30

    iget p0, p3, Lr05;->d:I

    if-eq p0, p2, :cond_32

    iput p2, p3, Lr05;->d:I

    invoke-virtual {p3}, Lr05;->s()V

    goto :goto_32

    :cond_30
    iput p2, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->b:I

    :cond_32
    :goto_32
    sub-int p3, p1, p2

    :cond_34
    const/4 p0, 0x1

    aput p3, p6, p0

    :cond_37
    return-void
.end method

.method public final q(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III[I)V
    .registers 7

    if-eqz p5, :cond_37

    iget-object p1, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->e:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    :cond_9
    iget-object p1, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    const/4 p3, 0x0

    if-eqz p1, :cond_11

    iget p1, p1, Lr05;->d:I

    goto :goto_12

    :cond_11
    move p1, p3

    :goto_12
    sub-int p4, p1, p5

    invoke-virtual {p0, p2}, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->z(Landroid/view/View;)I

    move-result p5

    invoke-virtual {p0, p2}, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->y(Landroid/view/View;)I

    move-result p2

    invoke-static {p4, p5, p2}, Ldjh;->c(III)I

    move-result p2

    if-eq p1, p2, :cond_34

    iget-object p3, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    if-eqz p3, :cond_30

    iget p0, p3, Lr05;->d:I

    if-eq p0, p2, :cond_32

    iput p2, p3, Lr05;->d:I

    invoke-virtual {p3}, Lr05;->s()V

    goto :goto_32

    :cond_30
    iput p2, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->b:I

    :cond_32
    :goto_32
    sub-int p3, p1, p2

    :cond_34
    const/4 p0, 0x1

    aput p3, p6, p0

    :cond_37
    return-void
.end method

.method public final r(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .registers 5

    invoke-static {p2}, Lb8h;->h(Landroid/view/View;)Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;

    move-result-object p3

    const/4 p4, 0x0

    if-eqz p3, :cond_2d

    iget-object p3, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    if-eqz p3, :cond_e

    iget p3, p3, Lr05;->d:I

    goto :goto_f

    :cond_e
    move p3, p4

    :goto_f
    if-eqz p3, :cond_2d

    iget-object p3, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->e:Landroid/animation/ValueAnimator;

    if-eqz p3, :cond_18

    invoke-virtual {p3}, Landroid/animation/Animator;->cancel()V

    :cond_18
    iget-object p3, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    if-eqz p3, :cond_26

    iget p0, p3, Lr05;->d:I

    if-eqz p0, :cond_28

    iput p4, p3, Lr05;->d:I

    invoke-virtual {p3}, Lr05;->s()V

    goto :goto_28

    :cond_26
    iput p4, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->b:I

    :cond_28
    :goto_28
    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->f(Landroid/view/View;)V

    const/4 p0, 0x1

    return p0

    :cond_2d
    return p4
.end method

.method public final u(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II)Z
    .registers 6

    iget-object p0, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->e:Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    :cond_7
    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_d

    const/4 p0, 0x1

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public final v(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;I)V
    .registers 8

    iget-boolean p3, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->d:Z

    if-eqz p3, :cond_57

    iget-object p3, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->e:Landroid/animation/ValueAnimator;

    if-eqz p3, :cond_b

    invoke-virtual {p3}, Landroid/animation/Animator;->cancel()V

    :cond_b
    invoke-static {p2}, Lb8h;->h(Landroid/view/View;)Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;

    move-result-object p3

    if-eqz p3, :cond_57

    iget-object p3, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    if-eqz p3, :cond_18

    iget p3, p3, Lr05;->d:I

    goto :goto_19

    :cond_18
    const/4 p3, 0x0

    :goto_19
    invoke-virtual {p0, p2}, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->z(Landroid/view/View;)I

    move-result p4

    invoke-virtual {p0, p2}, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->y(Landroid/view/View;)I

    move-result v0

    sub-int v1, p3, p4

    sub-int v2, v0, p3

    if-lt v1, v2, :cond_28

    move p4, v0

    :cond_28
    if-eq p3, p4, :cond_57

    filled-new-array {p3, p4}, [I

    move-result-object p3

    invoke-static {p3}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object p3

    sget-wide v0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->f:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-virtual {p3, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object p4, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->g:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p3, p4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance p4, Laf1;

    const/4 v0, 0x2

    invoke-direct {p4, p0, p1, p2, v0}, Laf1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3, p4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance p1, Ldf1;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Ldf1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->start()V

    iput-object p3, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->e:Landroid/animation/ValueAnimator;

    :cond_57
    return-void
.end method

.method public final y(Landroid/view/View;)I
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_21

    iget-boolean p0, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->c:Z

    if-nez p0, :cond_21

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1a

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    goto :goto_1b

    :cond_1a
    const/4 p1, 0x0

    :goto_1b
    if-eqz p1, :cond_1f

    iget v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    :cond_1f
    add-int/2addr p0, v1

    return p0

    :cond_21
    return v1
.end method

.method public final z(Landroid/view/View;)I
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_22

    iget-boolean p0, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->c:Z

    if-eqz p0, :cond_22

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    neg-int p0, p0

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1b

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    goto :goto_1c

    :cond_1b
    const/4 p1, 0x0

    :goto_1c
    if-eqz p1, :cond_20

    iget v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    :cond_20
    sub-int/2addr p0, v1

    return p0

    :cond_22
    return v1
.end method
