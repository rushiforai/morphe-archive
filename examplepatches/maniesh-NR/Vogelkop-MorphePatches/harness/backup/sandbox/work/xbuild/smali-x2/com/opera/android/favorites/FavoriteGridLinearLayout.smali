.class public final Lcom/opera/android/favorites/FavoriteGridLinearLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/favorites/FavoriteGridLinearLayout;",
        "Landroid/widget/LinearLayout;",
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


# instance fields
.field public a:Ltta;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final onLayout(ZIIII)V
    .registers 12

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    if-eqz p1, :cond_a5

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p4

    sub-int/2addr p3, p4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p4

    sub-int/2addr p3, p4

    iget-object p4, p0, Lcom/opera/android/favorites/FavoriteGridLinearLayout;->a:Ltta;

    const/4 p5, 0x1

    if-nez p4, :cond_24

    move v1, p5

    goto :goto_51

    :cond_24
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget-object v2, p4, Ltta;->h:Lsta;

    iget v3, v2, Lsta;->a:I

    shl-int/2addr v1, p5

    sub-int/2addr v0, v1

    iget p4, p4, Ltta;->c:I

    move v4, p4

    move v1, p5

    :goto_36
    const/16 v5, 0x10

    if-ge v1, v5, :cond_45

    add-int v5, v4, v3

    add-int/2addr v5, p4

    if-gt v5, v0, :cond_45

    add-int v5, v3, p4

    add-int/2addr v4, v5

    add-int/lit8 v1, v1, 0x1

    goto :goto_36

    :cond_45
    if-le v1, p5, :cond_51

    add-int/lit8 v4, v1, -0x1

    mul-int/2addr p4, v1

    sub-int/2addr v0, p4

    div-int/2addr v0, v4

    iget p4, v2, Lsta;->b:I

    invoke-static {v0, v3, p4}, Ldjh;->c(III)I

    :cond_51
    :goto_51
    if-le v1, p5, :cond_59

    mul-int p4, v1, p2

    sub-int/2addr p3, p4

    sub-int/2addr v1, p5

    div-int/2addr p3, v1

    goto :goto_5a

    :cond_59
    move p3, p1

    :goto_5a
    add-int/2addr p2, p3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p3

    :goto_5f
    if-ge p1, p3, :cond_a5

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p4

    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v2

    if-ne v2, p5, :cond_8e

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    mul-int v3, p1, p2

    sub-int/2addr v2, v3

    sub-int v0, v2, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {p4, v0, v3, v2, v4}, Landroid/view/View;->layout(IIII)V

    goto :goto_a2

    :cond_8e
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    mul-int v3, p1, p2

    add-int/2addr v3, v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    add-int/2addr v0, v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {p4, v3, v2, v0, v4}, Landroid/view/View;->layout(IIII)V

    :goto_a2
    add-int/lit8 p1, p1, 0x1

    goto :goto_5f

    :cond_a5
    return-void
.end method

.method public final onMeasure(II)V
    .registers 9

    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->measureChildren(II)V

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_d
    if-ge v1, v0, :cond_26

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_23

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_26
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    add-int/2addr v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    add-int/2addr v1, v0

    invoke-static {v1, p2}, Landroid/view/View;->resolveSize(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
