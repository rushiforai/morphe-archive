.class public Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->a:Z

    .line 6
    .line 7
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->b:I

    .line 8
    .line 9
    sget-object v0, Ll/mhc0;->a:[I

    .line 10
    .line 11
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget p2, Ll/mhc0;->c:I

    .line 16
    .line 17
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->a:Z

    .line 22
    .line 23
    sget p2, Ll/mhc0;->b:I

    .line 24
    .line 25
    const/4 p3, -0x1

    .line 26
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-ltz p2, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->setOrientation(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final a(I)Landroid/view/View;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    sub-int/2addr v0, p1

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final b(II)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, p1, :cond_4

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const/16 v4, 0x8

    .line 21
    .line 22
    if-ne v3, v4, :cond_0

    .line 23
    .line 24
    goto :goto_2

    .line 25
    :cond_0
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 32
    .line 33
    add-int/2addr v0, v4

    .line 34
    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 35
    .line 36
    const/4 v5, -0x1

    .line 37
    if-ne v4, v5, :cond_1

    .line 38
    .line 39
    const v4, 0x800033

    .line 40
    .line 41
    .line 42
    :cond_1
    and-int/lit8 v4, v4, 0x70

    .line 43
    .line 44
    const/16 v5, 0x10

    .line 45
    .line 46
    if-eq v4, v5, :cond_3

    .line 47
    .line 48
    const/16 v5, 0x50

    .line 49
    .line 50
    if-eq v4, v5, :cond_2

    .line 51
    .line 52
    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    sub-int v4, p2, v4

    .line 60
    .line 61
    iget v5, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 62
    .line 63
    sub-int/2addr v4, v5

    .line 64
    goto :goto_1

    .line 65
    :cond_3
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    sub-int v4, p2, v4

    .line 70
    .line 71
    div-int/lit8 v4, v4, 0x2

    .line 72
    .line 73
    :goto_1
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    add-int/2addr v5, v0

    .line 78
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    add-int/2addr v6, v4

    .line 83
    invoke-virtual {v2, v0, v4, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    add-int/2addr v0, v2

    .line 91
    iget v2, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 92
    .line 93
    add-int/2addr v0, v2

    .line 94
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    return-void
.end method

.method public final c(II)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, p2, :cond_4

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const/16 v4, 0x8

    .line 21
    .line 22
    if-ne v3, v4, :cond_0

    .line 23
    .line 24
    goto :goto_2

    .line 25
    :cond_0
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 32
    .line 33
    add-int/2addr v0, v4

    .line 34
    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 35
    .line 36
    const/4 v5, -0x1

    .line 37
    if-ne v4, v5, :cond_1

    .line 38
    .line 39
    const v4, 0x800033

    .line 40
    .line 41
    .line 42
    :cond_1
    and-int/lit8 v4, v4, 0x7

    .line 43
    .line 44
    const/4 v5, 0x1

    .line 45
    if-eq v4, v5, :cond_3

    .line 46
    .line 47
    const/4 v5, 0x5

    .line 48
    if-eq v4, v5, :cond_2

    .line 49
    .line 50
    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 54
    .line 55
    sub-int v4, p1, v4

    .line 56
    .line 57
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    sub-int/2addr v4, v5

    .line 62
    goto :goto_1

    .line 63
    :cond_3
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    sub-int v4, p1, v4

    .line 68
    .line 69
    div-int/lit8 v4, v4, 0x2

    .line 70
    .line 71
    :goto_1
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    add-int/2addr v5, v4

    .line 76
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    add-int/2addr v6, v0

    .line 81
    invoke-virtual {v2, v4, v0, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    add-int/2addr v0, v2

    .line 89
    iget v2, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 90
    .line 91
    add-int/2addr v0, v2

    .line 92
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_4
    return-void
.end method

.method public final d(II)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v5, v1

    .line 7
    move v8, v5

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->a(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/16 v4, 0x8

    .line 19
    .line 20
    if-ne v2, v4, :cond_0

    .line 21
    .line 22
    move-object v2, p0

    .line 23
    move v4, p1

    .line 24
    move v6, p2

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const/4 v7, 0x0

    .line 27
    move-object v2, p0

    .line 28
    move v4, p1

    .line 29
    move v6, p2

    .line 30
    invoke-virtual/range {v2 .. v7}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    add-int/2addr v5, p0

    .line 38
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 43
    .line 44
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 45
    .line 46
    add-int/2addr v5, p1

    .line 47
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 48
    .line 49
    add-int/2addr v5, p0

    .line 50
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-static {v8, p0}, Ljava/lang/Math;->max(II)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    move v8, p0

    .line 59
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    move-object p0, v2

    .line 62
    move p1, v4

    .line 63
    move p2, v6

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    move-object v2, p0

    .line 66
    move v4, p1

    .line 67
    move v6, p2

    .line 68
    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    add-int/2addr v5, p0

    .line 73
    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    add-int/2addr v5, p0

    .line 78
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    add-int/2addr v8, p0

    .line 83
    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    add-int/2addr v8, p0

    .line 88
    invoke-virtual {v2}, Landroid/view/View;->getSuggestedMinimumWidth()I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    invoke-static {v5, p0}, Ljava/lang/Math;->max(II)I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {v2}, Landroid/view/View;->getSuggestedMinimumHeight()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    invoke-static {v8, p1}, Ljava/lang/Math;->max(II)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-virtual {v2, v4, v6, p1, p0}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->f(IIII)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final e(II)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    move v8, v2

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->a(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    const/16 v5, 0x8

    .line 19
    .line 20
    if-ne v3, v5, :cond_0

    .line 21
    .line 22
    move-object v3, p0

    .line 23
    move v5, p1

    .line 24
    move v7, p2

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const/4 v6, 0x0

    .line 27
    move-object v3, p0

    .line 28
    move v5, p1

    .line 29
    move v7, p2

    .line 30
    invoke-virtual/range {v3 .. v8}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    add-int/2addr v8, p0

    .line 38
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 43
    .line 44
    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 45
    .line 46
    add-int/2addr v8, p1

    .line 47
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 48
    .line 49
    add-int/2addr v8, p0

    .line 50
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-static {v2, p0}, Ljava/lang/Math;->max(II)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    move v2, p0

    .line 59
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    move-object p0, v3

    .line 62
    move p1, v5

    .line 63
    move p2, v7

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    move-object v3, p0

    .line 66
    move v5, p1

    .line 67
    move v7, p2

    .line 68
    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    add-int/2addr v2, p0

    .line 73
    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    add-int/2addr v2, p0

    .line 78
    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    add-int/2addr v8, p0

    .line 83
    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    add-int/2addr v8, p0

    .line 88
    invoke-virtual {v3}, Landroid/view/View;->getSuggestedMinimumWidth()I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    invoke-static {v2, p0}, Ljava/lang/Math;->max(II)I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {v3}, Landroid/view/View;->getSuggestedMinimumHeight()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    invoke-static {v8, p1}, Ljava/lang/Math;->max(II)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-virtual {v3, v5, v7, p1, p0}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->f(IIII)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final f(IIII)V
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/high16 v2, 0x40000000    # 2.0f

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    const/high16 v4, -0x80000000

    .line 21
    .line 22
    if-eq v0, v4, :cond_1

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    if-eq v0, v2, :cond_0

    .line 27
    .line 28
    move p4, v3

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move p4, p1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-static {p1, p4}, Ljava/lang/Math;->min(II)I

    .line 33
    .line 34
    .line 35
    move-result p4

    .line 36
    :cond_2
    :goto_0
    if-eq v1, v4, :cond_4

    .line 37
    .line 38
    if-eqz v1, :cond_5

    .line 39
    .line 40
    if-eq v1, v2, :cond_3

    .line 41
    .line 42
    move p3, v3

    .line 43
    goto :goto_1

    .line 44
    :cond_3
    move p3, p2

    .line 45
    goto :goto_1

    .line 46
    :cond_4
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    :cond_5
    :goto_1
    invoke-virtual {p0, p4, p3}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 1

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    sub-int/2addr p4, p2

    .line 7
    sub-int/2addr p5, p3

    .line 8
    invoke-virtual {p0, p4, p5}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->c(II)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sub-int/2addr p4, p2

    .line 13
    sub-int/2addr p5, p3

    .line 14
    invoke-virtual {p0, p4, p5}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->b(II)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->e(II)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->d(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setOrientation(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->b:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;->b:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
