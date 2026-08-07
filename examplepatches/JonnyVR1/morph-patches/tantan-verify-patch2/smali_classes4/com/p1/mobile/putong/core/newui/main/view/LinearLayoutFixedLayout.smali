.class public Lcom/p1/mobile/putong/core/newui/main/view/LinearLayoutFixedLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/view/LinearLayoutFixedLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/main/view/LinearLayoutFixedLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    sget-object p3, Ll/khc0;->M0:[I

    .line 7
    .line 8
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget p2, Ll/khc0;->N0:I

    .line 13
    .line 14
    const/4 p3, 0x0

    .line 15
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/main/view/LinearLayoutFixedLayout;->a:F

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public onLayout(ZIIII)V
    .locals 13

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sub-int v0, p5, p3

    .line 6
    .line 7
    div-int/lit8 v0, v0, 0x2

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    move v2, v1

    .line 11
    move v3, v2

    .line 12
    move v4, v3

    .line 13
    :goto_0
    if-ge v2, p1, :cond_4

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    .line 20
    .line 21
    .line 22
    move-result v6

    .line 23
    const/16 v7, 0x8

    .line 24
    .line 25
    if-ne v6, v7, :cond_0

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_0
    if-eqz v3, :cond_1

    .line 29
    .line 30
    invoke-virtual {v5, v1, v1, v1, v1}, Landroid/view/View;->layout(IIII)V

    .line 31
    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_1
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 39
    .line 40
    iget v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 41
    .line 42
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    .line 43
    .line 44
    .line 45
    move-result v8

    .line 46
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    .line 47
    .line 48
    .line 49
    move-result v9

    .line 50
    add-int/2addr v4, v7

    .line 51
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/main/view/LinearLayoutFixedLayout;->a:F

    .line 52
    .line 53
    const/4 v10, 0x0

    .line 54
    cmpl-float v10, v7, v10

    .line 55
    .line 56
    const/4 v11, 0x1

    .line 57
    if-lez v10, :cond_2

    .line 58
    .line 59
    add-int v10, v4, v8

    .line 60
    .line 61
    sub-int v12, p4, p2

    .line 62
    .line 63
    if-le v10, v12, :cond_2

    .line 64
    .line 65
    int-to-float v10, v4

    .line 66
    add-float/2addr v10, v7

    .line 67
    int-to-float v7, v12

    .line 68
    cmpg-float v7, v10, v7

    .line 69
    .line 70
    if-gez v7, :cond_2

    .line 71
    .line 72
    sub-int/2addr v12, v4

    .line 73
    div-int/lit8 v9, v9, 0x2

    .line 74
    .line 75
    sub-int v3, v0, v9

    .line 76
    .line 77
    add-int/2addr v12, v4

    .line 78
    add-int/2addr v9, v0

    .line 79
    invoke-virtual {v5, v4, v3, v12, v9}, Landroid/view/View;->layout(IIII)V

    .line 80
    .line 81
    .line 82
    :goto_1
    move v3, v11

    .line 83
    goto :goto_2

    .line 84
    :cond_2
    add-int v7, v4, v8

    .line 85
    .line 86
    sub-int v10, p4, p2

    .line 87
    .line 88
    if-le v7, v10, :cond_3

    .line 89
    .line 90
    invoke-virtual {v5, v1, v1, v1, v1}, Landroid/view/View;->layout(IIII)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    div-int/lit8 v9, v9, 0x2

    .line 95
    .line 96
    sub-int v10, v0, v9

    .line 97
    .line 98
    add-int/2addr v9, v0

    .line 99
    invoke-virtual {v5, v4, v10, v7, v9}, Landroid/view/View;->layout(IIII)V

    .line 100
    .line 101
    .line 102
    iget v5, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 103
    .line 104
    add-int/2addr v4, v5

    .line 105
    add-int/2addr v4, v8

    .line 106
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_4
    return-void
.end method
