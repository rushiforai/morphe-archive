.class public final Lcom/opera/android/search/behavior/ToolbarScrollingBehavior;
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
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u001d\u0008\u0007\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/opera/android/search/behavior/ToolbarScrollingBehavior;",
        "Lcom/opera/android/search/behavior/ViewOffsetBehavior;",
        "Landroid/view/View;",
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


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 10
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/opera/android/search/behavior/ToolbarScrollingBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

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

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_5

    const/4 p2, 0x0

    :cond_5
    invoke-direct {p0, p1, p2}, Lcom/opera/android/search/behavior/ToolbarScrollingBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static y(Ljava/util/List;)Landroid/view/View;
    .registers 3

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    sget-object v1, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->g:Landroid/view/animation/DecelerateInterpolator;

    invoke-static {v0}, Lb8h;->h(Landroid/view/View;)Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;

    move-result-object v1

    if-eqz v1, :cond_6

    return-object v0

    :cond_1b
    const-string p0, "Collection contains no element matching the predicate."

    invoke-static {p0}, Lh9o;->h(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final f(Landroid/view/View;Landroid/view/View;)Z
    .registers 3

    sget-object p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->g:Landroid/view/animation/DecelerateInterpolator;

    invoke-static {p2}, Lb8h;->h(Landroid/view/View;)Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;

    move-result-object p0

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final h(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .registers 5

    sget-object p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->g:Landroid/view/animation/DecelerateInterpolator;

    invoke-static {p3}, Lb8h;->h(Landroid/view/View;)Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;

    move-result-object p0

    const/4 p1, 0x0

    if-nez p0, :cond_a

    return p1

    :cond_a
    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_23

    iget-boolean p0, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->c:Z

    if-eqz p0, :cond_19

    invoke-virtual {p3}, Landroid/view/View;->getBottom()I

    move-result p0

    goto :goto_24

    :cond_19
    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    move-result p0

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p3

    sub-int/2addr p0, p3

    goto :goto_24

    :cond_23
    move p0, p1

    :goto_24
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p3

    sub-int/2addr p0, p3

    invoke-virtual {p2, p0}, Landroid/view/View;->offsetTopAndBottom(I)V

    return p1
.end method

.method public final m(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;III)Z
    .registers 6

    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->j(Landroid/view/View;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/search/behavior/ToolbarScrollingBehavior;->y(Ljava/util/List;)Landroid/view/View;

    invoke-static {p5}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p0

    const/high16 p5, 0x40000000    # 2.0f

    invoke-static {p0, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p0

    invoke-virtual {p1, p3, p4, p0, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->s(IIILandroid/view/View;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final x(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)V
    .registers 6

    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->j(Landroid/view/View;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/search/behavior/ToolbarScrollingBehavior;->y(Ljava/util/List;)Landroid/view/View;

    move-result-object p0

    sget-object v0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->g:Landroid/view/animation/DecelerateInterpolator;

    invoke-static {p0}, Lb8h;->h(Landroid/view/View;)Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;

    move-result-object v0

    if-eqz v0, :cond_56

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_56

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    check-cast p3, Lqv5;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p1

    iget v1, p3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr p1, v1

    iget-boolean v0, v0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->c:Z

    if-eqz v0, :cond_3c

    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    move-result p0

    iget p3, p3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr p0, p3

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p3

    add-int/2addr p3, p1

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    add-int/2addr v0, p0

    invoke-virtual {p2, p1, p0, p3, v0}, Landroid/view/View;->layout(IIII)V

    return-void

    :cond_3c
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result p0

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    sub-int/2addr p0, v0

    iget p3, p3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr p0, p3

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p3

    add-int/2addr p3, p1

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    add-int/2addr v0, p0

    invoke-virtual {p2, p1, p0, p3, v0}, Landroid/view/View;->layout(IIII)V

    return-void

    :cond_56
    invoke-virtual {p1, p3, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r(ILandroid/view/View;)V

    return-void
.end method
