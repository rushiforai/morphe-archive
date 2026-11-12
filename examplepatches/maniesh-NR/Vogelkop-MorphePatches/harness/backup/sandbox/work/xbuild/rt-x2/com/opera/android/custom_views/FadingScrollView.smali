.class public Lcom/opera/android/custom_views/FadingScrollView;
.super Landroid/widget/ScrollView;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:I

.field public final c:Lz5n;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    iput v0, p0, Lcom/opera/android/custom_views/FadingScrollView;->a:I

    new-instance v0, Lz5n;

    invoke-direct {v0, p0, p1, p2}, Lz5n;-><init>(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/FadingScrollView;->c:Lz5n;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;)Z
    .registers 5

    const/16 v0, 0x2002

    invoke-virtual {p1, v0}, Landroid/view/InputEvent;->isFromSource(I)Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    iget v2, p0, Lcom/opera/android/custom_views/FadingScrollView;->a:I

    if-ne v0, v1, :cond_1b

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p0

    int-to-float p1, v2

    cmpg-float p0, p0, p1

    if-ltz p0, :cond_2a

    goto :goto_29

    :cond_1b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    sub-int/2addr p0, v2

    int-to-float p0, p0

    cmpl-float p0, p1, p0

    if-gtz p0, :cond_2a

    :goto_29
    return v1

    :cond_2a
    const/4 p0, 0x0

    return p0
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 10

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/FadingScrollView;->c:Lz5n;

    iget v1, v0, Lz5n;->f:I

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    if-nez v2, :cond_12

    move v2, v4

    goto :goto_21

    :cond_12
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    move-result v2

    if-ge v2, v1, :cond_20

    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    move-result v2

    int-to-float v2, v2

    int-to-float v5, v1

    div-float/2addr v2, v5

    goto :goto_21

    :cond_20
    move v2, v3

    :goto_21
    iget v5, v0, Lz5n;->f:I

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-nez v6, :cond_2b

    move v6, v4

    goto :goto_3a

    :cond_2b
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v6

    if-ge v6, v5, :cond_39

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v6

    int-to-float v6, v6

    int-to-float v5, v5

    div-float/2addr v6, v5

    goto :goto_3a

    :cond_39
    move v6, v3

    :goto_3a
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-nez v5, :cond_43

    move v5, v4

    :goto_41
    move v4, v6

    goto :goto_62

    :cond_43
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    move-result v5

    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    move-result v7

    sub-int/2addr v5, v7

    sub-int/2addr v5, v4

    if-ge v5, v1, :cond_60

    int-to-float v3, v5

    int-to-float v1, v1

    div-float/2addr v3, v1

    :cond_60
    move v5, v3

    goto :goto_41

    :goto_62
    invoke-virtual {v0, p0}, Lz5n;->b(Landroid/widget/FrameLayout;)F

    move-result v6

    move-object v1, p1

    move v3, v2

    move-object v2, p0

    invoke-virtual/range {v0 .. v6}, Lz5n;->a(Landroid/graphics/Canvas;Landroid/view/View;FFFF)V

    return-void
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_15

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->isButtonPressed(I)Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/FadingScrollView;->a(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_15

    move v0, v1

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    if-eqz v0, :cond_1d

    iget v2, p0, Lcom/opera/android/custom_views/FadingScrollView;->b:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/opera/android/custom_views/FadingScrollView;->b:I

    :cond_1d
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz v0, :cond_28

    iget v0, p0, Lcom/opera/android/custom_views/FadingScrollView;->b:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/opera/android/custom_views/FadingScrollView;->b:I

    :cond_28
    return p1
.end method

.method public final isVerticalScrollBarEnabled()Z
    .registers 2

    iget v0, p0, Lcom/opera/android/custom_views/FadingScrollView;->b:I

    if-nez v0, :cond_c

    invoke-super {p0}, Landroid/view/View;->isVerticalScrollBarEnabled()Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;
    .registers 5

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/FadingScrollView;->a(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_c

    iget v1, p0, Lcom/opera/android/custom_views/FadingScrollView;->b:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/opera/android/custom_views/FadingScrollView;->b:I

    :cond_c
    invoke-super {p0, p1, p2}, Landroid/view/View;->onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;

    move-result-object p1

    if-eqz v0, :cond_18

    iget p2, p0, Lcom/opera/android/custom_views/FadingScrollView;->b:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/opera/android/custom_views/FadingScrollView;->b:I

    :cond_18
    return-object p1
.end method
