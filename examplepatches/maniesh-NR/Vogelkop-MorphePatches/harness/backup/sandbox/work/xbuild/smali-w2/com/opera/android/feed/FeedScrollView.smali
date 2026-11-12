.class public Lcom/opera/android/feed/FeedScrollView;
.super Landroidx/core/widget/NestedScrollView;
.source "SourceFile"


# static fields
.field public static final synthetic T:I


# instance fields
.field public final D:Li7f;

.field public E:I

.field public F:I

.field public G:I

.field public H:Li4d;

.field public I:Lfx8;

.field public J:Lut3;

.field public K:Z

.field public L:F

.field public M:Lgo8;

.field public final N:Landroid/graphics/Paint;

.field public final O:Landroid/graphics/Paint;

.field public final P:Landroid/graphics/Paint;

.field public Q:I

.field public R:I

.field public S:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroidx/core/widget/NestedScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lcom/opera/android/feed/FeedScrollView;->D:Li7f;

    new-instance p1, Lhr5;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/feed/FeedScrollView;->I:Lfx8;

    sget-object p1, Lgo8;->d:Lgo8;

    iput-object p1, p0, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/opera/android/feed/FeedScrollView;->N:Landroid/graphics/Paint;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/opera/android/feed/FeedScrollView;->O:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/opera/android/feed/FeedScrollView;->P:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->setWillNotDraw(Z)V

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    invoke-direct {p1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    invoke-direct {p1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    new-instance p1, Lhw7;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lhw7;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Landroidx/core/widget/NestedScrollView;->z:Lile;

    return-void
.end method

.method public static G(Landroid/view/View;[IILandroid/view/ViewGroup;)V
    .registers 4

    if-eq p0, p3, :cond_c

    const/4 p0, 0x0

    invoke-virtual {p3, p0, p2}, Landroid/view/View;->scrollBy(II)V

    const/4 p0, 0x1

    aget p3, p1, p0

    add-int/2addr p3, p2

    aput p3, p1, p0

    :cond_c
    return-void
.end method


# virtual methods
.method public final F(Lile;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/feed/FeedScrollView;->D:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(ILandroid/view/View;)V
    .registers 5

    invoke-super {p0, p1, p2}, Landroidx/core/widget/NestedScrollView;->b(ILandroid/view/View;)V

    iget p2, p0, Lcom/opera/android/feed/FeedScrollView;->Q:I

    const/4 v0, 0x1

    sub-int/2addr p2, v0

    iput p2, p0, Lcom/opera/android/feed/FeedScrollView;->Q:I

    if-nez p1, :cond_12

    iget v1, p0, Lcom/opera/android/feed/FeedScrollView;->R:I

    if-lez v1, :cond_12

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/opera/android/feed/FeedScrollView;->R:I

    :cond_12
    if-nez p2, :cond_26

    if-eq p1, v0, :cond_17

    const/4 v0, 0x0

    :cond_17
    iget-object p1, p0, Lcom/opera/android/feed/FeedScrollView;->I:Lfx8;

    if-eqz v0, :cond_22

    iget p0, p0, Lcom/opera/android/feed/FeedScrollView;->L:F

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    goto :goto_23

    :cond_22
    const/4 p0, 0x0

    :goto_23
    invoke-interface {p1, p0}, Lfx8;->a(Ljava/lang/Float;)V

    :cond_26
    return-void
.end method

.method public final canScrollVertically(I)Z
    .registers 5

    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->computeVerticalScrollOffset()I

    move-result v0

    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->computeVerticalScrollRange()I

    move-result v1

    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->computeVerticalScrollExtent()I

    move-result p0

    sub-int/2addr v1, p0

    const/4 p0, 0x0

    if-nez v1, :cond_11

    return p0

    :cond_11
    const/4 v2, 0x1

    if-gez p1, :cond_18

    if-lez v0, :cond_17

    return v2

    :cond_17
    return p0

    :cond_18
    if-ge v0, v1, :cond_1b

    return v2

    :cond_1b
    return p0
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 16

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v0

    iget v1, p0, Lcom/opera/android/feed/FeedScrollView;->G:I

    add-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int/2addr v3, v2

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0, v1, v3}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    :try_start_1b
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V
    :try_end_1e
    .catch Ljava/lang/NullPointerException; {:try_start_1b .. :try_end_1e} :catch_1f

    goto :goto_2c

    :catch_1f
    iget-boolean v0, p0, Lcom/opera/android/feed/FeedScrollView;->K:Z

    if-nez v0, :cond_2c

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/feed/FeedScrollView;->K:Z

    const-string v0, "dispatchDraw threw NPE"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2c
    :goto_2c
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    iget-object v0, p0, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object v0, v0, Lgo8;->b:Lgvl;

    invoke-virtual {v0}, Lgvl;->a()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_74

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v5, v0

    iget-object v0, p0, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object v0, v0, Lgo8;->b:Lgvl;

    iget v0, v0, Lgvl;->a:I

    int-to-float v6, v0

    iget-object v7, p0, Lcom/opera/android/feed/FeedScrollView;->N:Landroid/graphics/Paint;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    move-object v8, v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float v11, p1

    iget-object p1, p0, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object p1, p1, Lgo8;->b:Lgvl;

    iget v0, p1, Lgvl;->c:I

    iget p1, p1, Lgvl;->b:I

    add-int/2addr v0, p1

    int-to-float v12, v0

    iget-object v13, p0, Lcom/opera/android/feed/FeedScrollView;->O:Landroid/graphics/Paint;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v8}, Landroid/graphics/Canvas;->restore()V

    goto :goto_75

    :cond_74
    move-object v8, p1

    :goto_75
    iget-object p1, p0, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object p1, p1, Lgo8;->c:Lrp3;

    invoke-virtual {p1}, Lrp3;->a()Z

    move-result p1

    if-eqz p1, :cond_a9

    iget-object p1, p0, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object p1, p1, Lgo8;->c:Lrp3;

    iget v0, p1, Lrp3;->a:I

    iget p1, p1, Lrp3;->b:I

    add-int/2addr v0, p1

    invoke-virtual {v8}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    add-int/2addr v2, p1

    sub-int/2addr v2, v0

    int-to-float p1, v2

    invoke-virtual {v8, v1, p1}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float v11, p1

    int-to-float v12, v0

    iget-object v13, p0, Lcom/opera/android/feed/FeedScrollView;->P:Landroid/graphics/Paint;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v8}, Landroid/graphics/Canvas;->restore()V

    :cond_a9
    return-void
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_10

    if-eq v0, v1, :cond_c

    const/4 v2, 0x3

    if-ne v0, v2, :cond_12

    :cond_c
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/feed/FeedScrollView;->S:Z

    goto :goto_12

    :cond_10
    iput-boolean v1, p0, Lcom/opera/android/feed/FeedScrollView;->S:Z

    :cond_12
    :goto_12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_37

    iget-object v0, p0, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object v0, v0, Lgo8;->c:Lrp3;

    invoke-virtual {v0}, Lrp3;->a()Z

    move-result v0

    if-eqz v0, :cond_37

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/opera/android/feed/FeedScrollView;->M:Lgo8;

    iget-object v3, v3, Lgo8;->c:Lrp3;

    iget v3, v3, Lrp3;->b:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    cmpl-float v0, v0, v2

    if-lez v0, :cond_37

    return v1

    :cond_37
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final e(Landroid/view/View;II[II)V
    .registers 12

    const/4 v5, 0x0

    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->x:Ls14;

    move v1, p2

    move v2, p3

    move-object v4, p4

    move v3, p5

    invoke-virtual/range {v0 .. v5}, Ls14;->v(III[I[I)Z

    const/4 p2, 0x1

    aget p3, v4, p2

    sub-int p3, v2, p3

    if-lez p3, :cond_13

    move p4, p2

    goto :goto_14

    :cond_13
    const/4 p4, 0x0

    :goto_14
    iget-object p5, p0, Lcom/opera/android/feed/FeedScrollView;->H:Li4d;

    const/4 v0, 0x0

    if-eqz p5, :cond_25

    iget-object p5, p5, Li4d;->b:Ljava/lang/Object;

    check-cast p5, Lc5k;

    invoke-virtual {p5}, Lc5k;->b()Lxw8;

    move-result-object p5

    if-eqz p5, :cond_25

    iget-object v0, p5, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    :cond_25
    if-eqz p4, :cond_37

    invoke-virtual {p0, p2}, Lcom/opera/android/feed/FeedScrollView;->canScrollVertically(I)Z

    move-result p2

    if-eqz p2, :cond_31

    invoke-static {p1, v4, p3, p0}, Lcom/opera/android/feed/FeedScrollView;->G(Landroid/view/View;[IILandroid/view/ViewGroup;)V

    return-void

    :cond_31
    if-eqz v0, :cond_4d

    invoke-static {p1, v4, p3, v0}, Lcom/opera/android/feed/FeedScrollView;->G(Landroid/view/View;[IILandroid/view/ViewGroup;)V

    return-void

    :cond_37
    const/4 p2, -0x1

    if-eqz v0, :cond_44

    invoke-virtual {v0, p2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p4

    if-eqz p4, :cond_44

    invoke-static {p1, v4, p3, v0}, Lcom/opera/android/feed/FeedScrollView;->G(Landroid/view/View;[IILandroid/view/ViewGroup;)V

    return-void

    :cond_44
    invoke-virtual {p0, p2}, Lcom/opera/android/feed/FeedScrollView;->canScrollVertically(I)Z

    move-result p2

    if-eqz p2, :cond_4d

    invoke-static {p1, v4, p3, p0}, Lcom/opera/android/feed/FeedScrollView;->G(Landroid/view/View;[IILandroid/view/ViewGroup;)V

    :cond_4d
    return-void
.end method

.method public final k(Landroid/view/View;Landroid/view/View;II)Z
    .registers 7

    iget-object v0, p0, Lcom/opera/android/feed/FeedScrollView;->H:Li4d;

    if-eqz v0, :cond_23

    iget-object v0, v0, Li4d;->b:Ljava/lang/Object;

    check-cast v0, Lc5k;

    iget-object v1, v0, Lc5k;->o:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Lc5k;->b()Lxw8;

    move-result-object v0

    if-eqz v0, :cond_13

    iget-object v0, v0, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    if-ne p2, v0, :cond_1c

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->L0()V

    goto :goto_23

    :cond_1c
    if-ne p2, v1, :cond_23

    if-eqz v0, :cond_23

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->L0()V

    :cond_23
    :goto_23
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/core/widget/NestedScrollView;->k(Landroid/view/View;Landroid/view/View;II)Z

    move-result p1

    if-eqz p1, :cond_37

    iget p1, p0, Lcom/opera/android/feed/FeedScrollView;->Q:I

    const/4 p2, 0x1

    add-int/2addr p1, p2

    iput p1, p0, Lcom/opera/android/feed/FeedScrollView;->Q:I

    if-nez p4, :cond_36

    iget p1, p0, Lcom/opera/android/feed/FeedScrollView;->R:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/opera/android/feed/FeedScrollView;->R:I

    :cond_36
    return p2

    :cond_37
    const/4 p0, 0x0

    return p0
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/feed/FeedScrollView;->S:Z

    iput v0, p0, Lcom/opera/android/feed/FeedScrollView;->R:I

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroidx/core/widget/NestedScrollView;->onLayout(ZIIII)V

    iget-object p1, p0, Lcom/opera/android/feed/FeedScrollView;->H:Li4d;

    const/4 p2, 0x0

    if-eqz p1, :cond_14

    iget-object p1, p1, Li4d;->b:Ljava/lang/Object;

    check-cast p1, Lc5k;

    invoke-virtual {p1}, Lc5k;->b()Lxw8;

    move-result-object p1

    if-eqz p1, :cond_14

    iget-object p2, p1, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    :cond_14
    if-eqz p2, :cond_2a

    const/4 p1, -0x1

    invoke-virtual {p2, p1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p1

    if-eqz p1, :cond_2a

    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->computeVerticalScrollRange()I

    move-result p1

    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->computeVerticalScrollExtent()I

    move-result p2

    sub-int/2addr p1, p2

    const/4 p2, 0x0

    invoke-virtual {p0, p2, p1}, Landroid/view/View;->scrollBy(II)V

    :cond_2a
    return-void
.end method

.method public final onMeasure(II)V
    .registers 5

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iput v0, p0, Lcom/opera/android/feed/FeedScrollView;->F:I

    iget-object v1, p0, Lcom/opera/android/feed/FeedScrollView;->J:Lut3;

    if-eqz v1, :cond_d

    invoke-virtual {v1, v0}, Lut3;->accept(I)V

    :cond_d
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iget v1, p0, Lcom/opera/android/feed/FeedScrollView;->E:I

    if-eqz v1, :cond_21

    if-eq v1, v0, :cond_21

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_21

    invoke-virtual {v1}, Landroid/view/View;->forceLayout()V

    :cond_21
    iput v0, p0, Lcom/opera/android/feed/FeedScrollView;->E:I

    invoke-super {p0, p1, p2}, Landroidx/core/widget/NestedScrollView;->onMeasure(II)V

    return-void
.end method

.method public final onNestedPreFling(Landroid/view/View;FF)Z
    .registers 4

    iput p3, p0, Lcom/opera/android/feed/FeedScrollView;->L:F

    iget-object p0, p0, Landroidx/core/widget/NestedScrollView;->x:Ls14;

    invoke-virtual {p0, p2, p3}, Ls14;->u(FF)Z

    move-result p0

    return p0
.end method

.method public final z(Ln9n;)V
    .registers 2

    return-void
.end method
