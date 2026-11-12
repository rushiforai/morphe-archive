.class public Lcom/opera/android/feed/FeedPageRecyclerView;
.super Lcom/opera/android/custom_views/FadingRecyclerView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/FadingRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_3c

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    :goto_a
    if-eqz v0, :cond_18

    instance-of v1, v0, Lcom/opera/android/feed/FeedContainerView;

    if-eqz v1, :cond_13

    check-cast v0, Lcom/opera/android/feed/FeedContainerView;

    goto :goto_19

    :cond_13
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_a

    :cond_18
    const/4 v0, 0x0

    :goto_19
    if-eqz v0, :cond_3c

    invoke-static {p0, v0}, Lq9n;->q(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iget v1, v1, Landroid/graphics/Point;->x:I

    int-to-float v1, v1

    add-float/2addr v2, v1

    iget v1, v0, Lcom/opera/android/feed/FeedContainerView;->a:I

    int-to-float v1, v1

    cmpg-float v1, v2, v1

    if-ltz v1, :cond_3a

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    iget v0, v0, Lcom/opera/android/feed/FeedContainerView;->a:I

    sub-int/2addr v1, v0

    int-to-float v0, v1

    cmpl-float v0, v2, v0

    if-lez v0, :cond_3c

    :cond_3a
    const/4 p0, 0x1

    return p0

    :cond_3c
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
