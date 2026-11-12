.class public Lcom/opera/android/widget/AspectRatioFrameLayout;
.super Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic d:I


# instance fields
.field public final c:Lrn9;


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

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Lrn9;

    new-instance v1, Lbi;

    const/16 v2, 0x1c

    invoke-direct {v1, p0, v2}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lrn9;-><init>(Lla2;)V

    iput-object v0, p0, Lcom/opera/android/widget/AspectRatioFrameLayout;->c:Lrn9;

    invoke-virtual {v0, p1, p2}, Lrn9;->B(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final synthetic d(II)V
    .registers 3

    invoke-super {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;->onMeasure(II)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 8

    iget-object v0, p0, Lcom/opera/android/widget/AspectRatioFrameLayout;->c:Lrn9;

    invoke-virtual {v0, p1, p2}, Lrn9;->H(II)Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    const/4 v0, 0x0

    const/high16 v1, 0x40000000    # 2.0f

    if-eq p1, v1, :cond_1d

    const/high16 v2, -0x80000000

    if-ne p1, v2, :cond_1b

    if-ne p2, v1, :cond_1d

    :cond_1b
    move p1, v0

    goto :goto_1e

    :cond_1d
    const/4 p1, 0x1

    :goto_1e
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    move v3, v0

    :goto_27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v0, v4, :cond_43

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-eqz p1, :cond_38

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    goto :goto_3c

    :cond_38
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    :goto_3c
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    :cond_43
    if-eqz p1, :cond_49

    if-ge v2, v3, :cond_4b

    move v2, v3

    goto :goto_4d

    :cond_49
    if-lt p2, v3, :cond_4c

    :cond_4b
    return-void

    :cond_4c
    move p2, v3

    :goto_4d
    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;->onMeasure(II)V

    return-void
.end method
