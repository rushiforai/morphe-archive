.class public Lcom/opera/android/custom_views/OperaButtonBarLayout;
.super Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;
.source "SourceFile"


# instance fields
.field public final c:I

.field public d:I


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

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/opera/android/custom_views/OperaButtonBarLayout;->d:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenHeightDp:I

    const/16 v1, 0x140

    const/4 v2, 0x0

    if-lt v0, v1, :cond_17

    const/4 v0, 0x1

    goto :goto_18

    :cond_17
    move v0, v2

    :goto_18
    sget-object v1, Lkhh;->t:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/OperaButtonBarLayout;->c:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final f(Z)V
    .registers 10

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/4 v0, 0x1

    iget v1, p0, Lcom/opera/android/custom_views/OperaButtonBarLayout;->c:I

    if-eqz p1, :cond_e

    if-ne v1, v0, :cond_e

    const v2, 0x800005

    goto :goto_10

    :cond_e
    const/16 v2, 0x50

    :goto_10
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const v2, 0x7f0a0a9f

    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_25

    if-eqz p1, :cond_21

    const/16 v3, 0x8

    goto :goto_22

    :cond_21
    const/4 v3, 0x4

    :goto_22
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    sub-int/2addr v2, v0

    move v0, v2

    :goto_2b
    if-ltz v0, :cond_89

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    const v5, 0x7f0a07b9

    const v6, 0x7f0a07ba

    if-eqz p1, :cond_61

    invoke-virtual {v4}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {v4}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    const/4 v5, 0x2

    if-ne v1, v5, :cond_7b

    const/4 v5, -0x1

    goto :goto_7c

    :cond_61
    invoke-virtual {v3, v6}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v3, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    :cond_7b
    const/4 v5, -0x2

    :goto_7c
    iput v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    if-eq v0, v2, :cond_86

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    :cond_86
    add-int/lit8 v0, v0, -0x1

    goto :goto_2b

    :cond_89
    return-void
.end method

.method public final onMeasure(II)V
    .registers 9

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iget v1, p0, Lcom/opera/android/custom_views/OperaButtonBarLayout;->d:I

    const/4 v2, 0x0

    iget v3, p0, Lcom/opera/android/custom_views/OperaButtonBarLayout;->c:I

    const/4 v4, 0x1

    if-le v0, v1, :cond_17

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v1

    if-ne v1, v4, :cond_17

    if-ne v3, v4, :cond_17

    invoke-virtual {p0, v2}, Lcom/opera/android/custom_views/OperaButtonBarLayout;->f(Z)V

    :cond_17
    iput v0, p0, Lcom/opera/android/custom_views/OperaButtonBarLayout;->d:I

    if-ne v3, v4, :cond_2b

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    const/high16 v5, 0x40000000    # 2.0f

    if-ne v1, v5, :cond_2b

    const/high16 v1, -0x80000000

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    move v2, v4

    goto :goto_2c

    :cond_2b
    move v0, p1

    :goto_2c
    const/4 v1, 0x2

    if-ne v3, v1, :cond_38

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v1

    if-eq v1, v4, :cond_38

    invoke-virtual {p0, v4}, Lcom/opera/android/custom_views/OperaButtonBarLayout;->f(Z)V

    :cond_38
    invoke-super {p0, v0, p2}, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->onMeasure(II)V

    if-ne v3, v4, :cond_52

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v0

    if-eq v0, v4, :cond_52

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidthAndState()I

    move-result v0

    const/high16 v1, -0x1000000

    and-int/2addr v0, v1

    const/high16 v1, 0x1000000

    if-ne v0, v1, :cond_52

    invoke-virtual {p0, v4}, Lcom/opera/android/custom_views/OperaButtonBarLayout;->f(Z)V

    goto :goto_53

    :cond_52
    move v4, v2

    :goto_53
    if-eqz v4, :cond_58

    invoke-super {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->onMeasure(II)V

    :cond_58
    return-void
.end method
