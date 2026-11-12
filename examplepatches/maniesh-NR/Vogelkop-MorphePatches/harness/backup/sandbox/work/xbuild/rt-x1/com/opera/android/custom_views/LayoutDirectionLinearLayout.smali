.class public Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lk2c;


# instance fields
.field public a:Ll2c;

.field public b:Lfr;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    const/4 p3, 0x0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final b()Ll2c;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->a:Ll2c;

    return-object p0
.end method

.method public final d(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    new-instance v0, Ll2c;

    invoke-direct {v0, p0, p0, p2}, Ll2c;-><init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->a:Ll2c;

    invoke-static {p1, p2}, Lfr;->f(Landroid/content/Context;Landroid/util/AttributeSet;)Lfr;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->b:Lfr;

    if-eqz p1, :cond_12

    invoke-virtual {p1, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_12
    return-void
.end method

.method public final e()V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->b:Lfr;

    if-eqz v0, :cond_7

    invoke-virtual {v0, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_c
    if-ge v1, v0, :cond_22

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v4, v3, Lm2c;

    if-eqz v4, :cond_1f

    check-cast v3, Lm2c;

    invoke-interface {v3, v2, p0}, Lm2c;->a(Landroid/view/View;Lk2c;)V

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_22
    return-void
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    new-instance v0, Lg2c;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lg2c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/LinearLayout$LayoutParams;
    .registers 3

    .line 10
    new-instance v0, Lg2c;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lg2c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final i(I)V
    .registers 3

    if-eqz p1, :cond_9

    const/4 v0, 0x1

    if-ne p1, v0, :cond_d

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutDirection(I)V

    goto :goto_d

    :cond_9
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutDirection(I)V

    :cond_d
    :goto_d
    invoke-virtual {p0}, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->e()V

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    invoke-static {p0}, Lcs5;->P(Landroid/view/ViewGroup;)V

    return-void
.end method

.method public onMeasure(II)V
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->e()V

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method
