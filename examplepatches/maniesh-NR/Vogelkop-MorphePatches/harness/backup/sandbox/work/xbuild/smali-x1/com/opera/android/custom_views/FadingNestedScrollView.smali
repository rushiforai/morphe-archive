.class public Lcom/opera/android/custom_views/FadingNestedScrollView;
.super Landroidx/core/widget/NestedScrollView;
.source "SourceFile"

# interfaces
.implements La6n;
.implements Lnij;


# instance fields
.field public final D:Lz5n;

.field public final E:Z

.field public F:Lj6j;

.field public final G:Lm9f;

.field public H:Lg00;

.field public I:Z

.field public J:Z

.field public K:Z


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

    invoke-direct {p0, p1, p2, v0}, Landroidx/core/widget/NestedScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v1, Lz5n;

    invoke-direct {v1, p0, p1, p2}, Lz5n;-><init>(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->D:Lz5n;

    sget-object v1, Lkhh;->l:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x2

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    if-eqz p2, :cond_2d

    new-instance p2, Lm9f;

    invoke-direct {p2, p0}, Lm9f;-><init>(Landroid/view/ViewGroup;)V

    iput-object p2, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->G:Lm9f;

    const/4 p2, 0x1

    invoke-virtual {p1, p2, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->E:Z

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->J:Z

    goto :goto_31

    :cond_2d
    iput-boolean v0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->E:Z

    iput-boolean v0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->J:Z

    :goto_31
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final a(Lg00;)V
    .registers 2

    iput-object p1, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->H:Lg00;

    return-void
.end method

.method public final c()V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->J:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    return-void

    :cond_6
    iput-boolean v1, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->J:Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 9

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->D:Lz5n;

    iget v1, v0, Lz5n;->f:I

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-nez v2, :cond_10

    const/4 v1, 0x0

    :goto_e
    move v4, v1

    goto :goto_22

    :cond_10
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v2

    if-ge v2, v1, :cond_1f

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v2

    int-to-float v2, v2

    int-to-float v1, v1

    div-float v1, v2, v1

    goto :goto_e

    :cond_1f
    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_e

    :goto_22
    const/4 v5, 0x0

    invoke-virtual {v0, p0}, Lz5n;->b(Landroid/widget/FrameLayout;)F

    move-result v6

    const/4 v3, 0x0

    move-object v2, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lz5n;->a(Landroid/graphics/Canvas;Landroid/view/View;FFFF)V

    return-void
.end method

.method public final f()V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->D:Lz5n;

    iget-boolean v0, p0, Lz5n;->n:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    return-void

    :cond_8
    iput-boolean v1, p0, Lz5n;->n:Z

    iget-object p0, p0, Lz5n;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final h(Landroid/content/res/ColorStateList;)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->D:Lz5n;

    iput-object p1, v0, Lz5n;->r:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 1

    invoke-super {p0}, Landroidx/core/widget/NestedScrollView;->onAttachedToWindow()V

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->G:Lm9f;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lm9f;->f()V

    :cond_a
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->G:Lm9f;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lm9f;->h()V

    :cond_a
    return-void
.end method

.method public onMeasure(II)V
    .registers 11

    iget-boolean v0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->E:Z

    iget-object v1, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->D:Lz5n;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->G:Lm9f;

    if-eqz v3, :cond_3e

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    if-eqz v4, :cond_4a

    invoke-virtual {v3}, Lm9f;->e()I

    move-result v3

    const/4 v4, 0x1

    if-lez v3, :cond_18

    move v5, v4

    goto :goto_19

    :cond_18
    move v5, v2

    :goto_19
    iput-boolean v4, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->I:Z

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {p0, v3, v6, v3, v7}, Landroid/view/View;->setPadding(IIII)V

    iput-boolean v2, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->I:Z

    if-eqz v0, :cond_2e

    if-lez v3, :cond_2e

    move v0, v4

    goto :goto_2f

    :cond_2e
    move v0, v2

    :goto_2f
    invoke-virtual {v1, v0}, Lz5n;->f(Z)V

    iget-boolean v0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->J:Z

    if-eqz v0, :cond_39

    if-lez v3, :cond_39

    move v2, v4

    :cond_39
    invoke-virtual {v1, v2}, Lz5n;->e(Z)V

    move v2, v5

    goto :goto_4a

    :cond_3e
    if-eqz v0, :cond_43

    invoke-virtual {v1, v2}, Lz5n;->f(Z)V

    :cond_43
    iget-boolean v0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->J:Z

    if-eqz v0, :cond_4a

    invoke-virtual {v1, v2}, Lz5n;->e(Z)V

    :cond_4a
    :goto_4a
    invoke-super {p0, p1, p2}, Landroidx/core/widget/NestedScrollView;->onMeasure(II)V

    iget-boolean p1, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->K:Z

    if-eq v2, p1, :cond_5a

    iput-boolean v2, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->K:Z

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->H:Lg00;

    if-eqz p0, :cond_5a

    invoke-virtual {p0, v2}, Lg00;->a(Z)V

    :cond_5a
    return-void
.end method

.method public final onScrollChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroidx/core/widget/NestedScrollView;->onScrollChanged(IIII)V

    iget-object p0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->F:Lj6j;

    if-eqz p0, :cond_1f

    iget p1, p0, Lj6j;->a:I

    if-ltz p1, :cond_1f

    if-le p2, p1, :cond_f

    const/4 p1, 0x1

    goto :goto_10

    :cond_f
    const/4 p1, 0x0

    :goto_10
    iget-boolean p2, p0, Lj6j;->b:Z

    if-eq p2, p1, :cond_1f

    iput-boolean p1, p0, Lj6j;->b:Z

    iget-object p0, p0, Lj6j;->c:Lk6j;

    iget-object p0, p0, Lk6j;->w:Landroid/view/MenuItem;

    if-eqz p0, :cond_1f

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1f
    return-void
.end method

.method public final requestLayout()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/custom_views/FadingNestedScrollView;->I:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-super {p0}, Landroidx/core/widget/NestedScrollView;->requestLayout()V

    return-void
.end method
