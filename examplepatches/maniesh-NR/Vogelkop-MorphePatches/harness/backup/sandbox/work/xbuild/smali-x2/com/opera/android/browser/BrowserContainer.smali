.class public Lcom/opera/android/browser/BrowserContainer;
.super Lcom/opera/android/InputFilterFrameLayout;
.source "SourceFile"


# instance fields
.field public d:I

.field public e:Landroid/view/View;


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

    invoke-direct {p0, p1, p2}, Lcom/opera/android/InputFilterFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/util/AttributeSet;)Lf2c;
    .registers 3

    new-instance v0, Lix3;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lix3;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 2

    instance-of p0, p1, Lix3;

    return p0
.end method

.method public final e(IZ)V
    .registers 4

    iget v0, p0, Lcom/opera/android/browser/BrowserContainer;->d:I

    if-eqz p2, :cond_8

    or-int/2addr v0, p1

    iput v0, p0, Lcom/opera/android/browser/BrowserContainer;->d:I

    return-void

    :cond_8
    not-int p1, p1

    and-int/2addr v0, p1

    iput v0, p0, Lcom/opera/android/browser/BrowserContainer;->d:I

    return-void
.end method

.method public final generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 1

    new-instance p0, Lix3;

    invoke-direct {p0}, Lix3;-><init>()V

    return-object p0
.end method

.method public final generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .registers 1

    .line 6
    new-instance p0, Lix3;

    invoke-direct {p0}, Lix3;-><init>()V

    return-object p0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    .line 55
    new-instance v0, Lix3;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lix3;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    instance-of p0, p1, Lix3;

    if-eqz p0, :cond_c

    new-instance p0, Lix3;

    check-cast p1, Lix3;

    invoke-direct {p0, p1}, Lix3;-><init>(Lix3;)V

    return-object p0

    :cond_c
    instance-of p0, p1, Lf2c;

    if-eqz p0, :cond_18

    new-instance p0, Lix3;

    check-cast p1, Lf2c;

    invoke-direct {p0, p1}, Lix3;-><init>(Lf2c;)V

    return-object p0

    :cond_18
    instance-of p0, p1, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz p0, :cond_24

    new-instance p0, Lix3;

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p0, p1}, Lix3;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    return-object p0

    :cond_24
    instance-of p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz p0, :cond_30

    new-instance p0, Lix3;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {p0, p1}, Lix3;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object p0

    :cond_30
    new-instance p0, Lix3;

    invoke-direct {p0, p1}, Lix3;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;
    .registers 3

    .line 54
    new-instance v0, Lix3;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lix3;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .registers 11

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_49

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v3, p1}, Lg3o;->g(Landroid/view/View;Landroid/view/WindowInsets;)Lg3o;

    move-result-object v3

    iget-object v3, v3, Lg3o;->a:Ld3o;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Lix3;

    iget v5, v4, Lix3;->b:I

    const/4 v6, 0x1

    and-int/2addr v5, v6

    const/16 v7, 0x287

    if-ne v5, v6, :cond_23

    move v5, v0

    goto :goto_29

    :cond_23
    invoke-virtual {v3, v7}, Ld3o;->i(I)Lr9b;

    move-result-object v5

    iget v5, v5, Lr9b;->b:I

    :goto_29
    iget v6, v4, Lix3;->b:I

    const/4 v8, 0x2

    and-int/2addr v6, v8

    if-ne v6, v8, :cond_31

    move v3, v0

    goto :goto_37

    :cond_31
    invoke-virtual {v3, v7}, Ld3o;->i(I)Lr9b;

    move-result-object v3

    iget v3, v3, Lr9b;->d:I

    :goto_37
    iget v6, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-ne v5, v6, :cond_3f

    iget v6, v4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    if-eq v3, v6, :cond_46

    :cond_3f
    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iput v3, v4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_46
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_49
    invoke-super {p0, p1}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method

.method public final onAttachedToWindow()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 7

    iget v0, p0, Lcom/opera/android/browser/BrowserContainer;->d:I

    and-int/lit8 v1, v0, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v1, v3, :cond_11

    and-int/lit8 v1, v0, 0x4

    const/4 v3, 0x4

    if-eq v1, v3, :cond_11

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_12

    :cond_11
    move v1, v2

    :cond_12
    iget-object v0, p0, Lcom/opera/android/browser/BrowserContainer;->e:Landroid/view/View;

    if-nez v0, :cond_23

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a03c6

    invoke-static {p0, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lcom/opera/android/browser/BrowserContainer;->e:Landroid/view/View;

    :cond_23
    if-nez v1, :cond_27

    const/16 v2, 0x8

    :cond_27
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-super {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;->onMeasure(II)V

    return-void
.end method

.method public final onViewAdded(Landroid/view/View;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onViewAdded(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/view/View;->requestApplyInsets()V

    return-void
.end method
