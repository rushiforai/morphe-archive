.class public Ll/o4h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/p4h;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;Landroid/animation/ValueAnimator;)V
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->setX(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;Landroid/graphics/Point;Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p1, v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0, p2, p3}, Ll/o4h;->e(Landroid/graphics/Point;Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final c(ILcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, p2}, Ll/o4h;->f(IILcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final d(ILcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->getAttachView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int/2addr v0, v1

    .line 14
    invoke-virtual {p0, p1, v0, p2}, Ll/o4h;->f(IILcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final e(Landroid/graphics/Point;Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V
    .locals 1

    .line 1
    iget p1, p1, Landroid/graphics/Point;->x:I

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->getAttachView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p1, v0}, Ll/ksg;->l0(II)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Ll/o4h;->d(ILcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/o4h;->c(ILcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final f(IILcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V
    .locals 1

    .line 1
    int-to-float p0, p1

    .line 2
    int-to-float p1, p2

    .line 3
    const/4 p2, 0x2

    .line 4
    new-array p2, p2, [F

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    aput p0, p2, v0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    aput p1, p2, p0

    .line 11
    .line 12
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/n4h;

    .line 17
    .line 18
    invoke-direct {p1, p3}, Ll/n4h;-><init>(Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 22
    .line 23
    .line 24
    const-wide/16 p1, 0x1f4

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 30
    .line 31
    .line 32
    return-void
.end method
