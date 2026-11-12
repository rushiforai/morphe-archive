.class public Lcom/opera/android/startpage/layout/toolbar/NewsToolbarLayout;
.super Landroidx/core/widget/NestedScrollView;
.source "SourceFile"


# instance fields
.field public final D:Landroid/graphics/Rect;


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

    invoke-direct {p0, p1, p2}, Landroidx/core/widget/NestedScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/opera/android/startpage/layout/toolbar/NewsToolbarLayout;->D:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroidx/core/widget/NestedScrollView;->onLayout(ZIIII)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p2

    iget-object p3, p0, Lcom/opera/android/startpage/layout/toolbar/NewsToolbarLayout;->D:Landroid/graphics/Rect;

    const/4 p4, 0x0

    invoke-virtual {p3, p4, p4, p1, p2}, Landroid/graphics/Rect;->set(IIII)V

    invoke-static {p0}, Lq9n;->x(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_1c

    invoke-static {p3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    goto :goto_1e

    :cond_1c
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_1e
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemGestureExclusionRects(Ljava/util/List;)V

    return-void
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    invoke-static {p0}, Lq9n;->x(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_10

    iget-object p1, p0, Lcom/opera/android/startpage/layout/toolbar/NewsToolbarLayout;->D:Landroid/graphics/Rect;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    goto :goto_12

    :cond_10
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_12
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemGestureExclusionRects(Ljava/util/List;)V

    return-void
.end method

.method public final postInvalidateOnAnimation()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    new-instance v0, Lyqd;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final postInvalidateOnAnimation(IIII)V
    .registers 5

    .line 14
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->postInvalidateOnAnimation(IIII)V

    .line 15
    new-instance p1, Lyqd;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method
