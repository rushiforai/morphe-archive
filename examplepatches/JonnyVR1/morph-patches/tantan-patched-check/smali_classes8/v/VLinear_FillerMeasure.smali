.class public Lv/VLinear_FillerMeasure;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {p0, p1, v0, v1}, Lv/VLinear_FillerMeasure;->a(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lv/VLinear_FillerMeasure;->a(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear_FillerMeasure;->a(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private a(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lv/VLinear_FillerMeasure;->a:I

    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    sget-object v1, Ll/hhc0;->P3:[I

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget p2, Ll/hhc0;->Q3:I

    .line 14
    .line 15
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Lv/VLinear_FillerMeasure;->a:I

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
.method public final b(Landroid/view/View;Landroid/widget/LinearLayout$LayoutParams;II)V
    .locals 2

    .line 1
    iget p2, p2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 2
    .line 3
    and-int/lit8 v0, p2, 0x70

    .line 4
    .line 5
    const/16 v1, 0x10

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p2, v0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    sub-int/2addr p2, p0

    .line 23
    div-int/lit8 p2, p2, 0x2

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    div-int/lit8 p0, p0, 0x2

    .line 30
    .line 31
    sub-int p0, p2, p0

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    div-int/lit8 v0, v0, 0x2

    .line 38
    .line 39
    add-int/2addr p2, v0

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    and-int/lit8 p2, p2, 0x70

    .line 42
    .line 43
    const/16 v0, 0x50

    .line 44
    .line 45
    if-ne p2, v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    sub-int/2addr p2, p0

    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    sub-int p0, p2, p0

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    add-int/2addr p2, p0

    .line 72
    :goto_0
    invoke-virtual {p1, p3, p0, p4, p2}, Landroid/view/View;->layout(IIII)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public c(III)I
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 24
    .line 25
    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 26
    .line 27
    sub-int/2addr p2, v1

    .line 28
    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 29
    .line 30
    sub-int/2addr p2, v1

    .line 31
    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 32
    .line 33
    if-lez v1, :cond_1

    .line 34
    .line 35
    if-ge v1, p2, :cond_1

    .line 36
    .line 37
    invoke-static {v1}, Ll/dox;->b(I)I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-static {p2}, Ll/dox;->a(I)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    :goto_0
    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 47
    .line 48
    if-lez v1, :cond_2

    .line 49
    .line 50
    invoke-static {v1}, Ll/dox;->b(I)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    const/4 v3, -0x1

    .line 56
    if-ne v1, v3, :cond_3

    .line 57
    .line 58
    invoke-static {p3}, Ll/dox;->b(I)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    goto :goto_1

    .line 63
    :cond_3
    if-lez p3, :cond_4

    .line 64
    .line 65
    invoke-static {p3}, Ll/dox;->a(I)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    :cond_4
    :goto_1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-virtual {p3, p2, v2}, Landroid/view/View;->measure(II)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    iget p1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 85
    .line 86
    add-int/2addr p0, p1

    .line 87
    iget p1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 88
    .line 89
    add-int/2addr p0, p1

    .line 90
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    sub-int/2addr p2, p3

    .line 14
    const/4 p3, 0x0

    .line 15
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result p4

    .line 19
    const/16 p5, 0x8

    .line 20
    .line 21
    if-ge p3, p4, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 32
    .line 33
    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 34
    .line 35
    and-int/lit8 v1, v1, 0x7

    .line 36
    .line 37
    const/4 v2, 0x3

    .line 38
    if-ne v1, v2, :cond_1

    .line 39
    .line 40
    invoke-virtual {p4}, Landroid/view/View;->getVisibility()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-ne v1, p5, :cond_0

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    iget p5, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 48
    .line 49
    add-int v1, p1, p5

    .line 50
    .line 51
    add-int/2addr p5, p1

    .line 52
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    add-int/2addr p5, v2

    .line 57
    invoke-virtual {p0, p4, v0, v1, p5}, Lv/VLinear_FillerMeasure;->b(Landroid/view/View;Landroid/widget/LinearLayout$LayoutParams;II)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 61
    .line 62
    .line 63
    move-result p4

    .line 64
    iget p5, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 65
    .line 66
    add-int/2addr p4, p5

    .line 67
    iget p5, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 68
    .line 69
    add-int/2addr p4, p5

    .line 70
    add-int/2addr p1, p4

    .line 71
    :goto_1
    add-int/lit8 p3, p3, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    add-int/lit8 p1, p1, -0x1

    .line 79
    .line 80
    :goto_2
    if-lt p1, p3, :cond_3

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p4

    .line 86
    invoke-virtual {p4}, Landroid/view/View;->getVisibility()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-ne v0, p5, :cond_2

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_2
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 98
    .line 99
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    sub-int v1, p2, v1

    .line 104
    .line 105
    iget v2, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 106
    .line 107
    sub-int/2addr v1, v2

    .line 108
    sub-int v2, p2, v2

    .line 109
    .line 110
    invoke-virtual {p0, p4, v0, v1, v2}, Lv/VLinear_FillerMeasure;->b(Landroid/view/View;Landroid/widget/LinearLayout$LayoutParams;II)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 114
    .line 115
    .line 116
    move-result p4

    .line 117
    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 118
    .line 119
    add-int/2addr p4, v1

    .line 120
    iget v0, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 121
    .line 122
    add-int/2addr p4, v0

    .line 123
    sub-int/2addr p2, p4

    .line 124
    :goto_3
    add-int/lit8 p1, p1, -0x1

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_3
    return-void
.end method

.method public onMeasure(II)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    sub-int/2addr v0, v1

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sub-int/2addr v0, v1

    .line 25
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    sub-int/2addr v1, v2

    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    sub-int/2addr v1, v2

    .line 39
    const/4 v2, -0x1

    .line 40
    const/4 v3, -0x2

    .line 41
    const/4 v4, 0x0

    .line 42
    if-lez v1, :cond_6

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    iget v5, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 49
    .line 50
    if-ne v5, v3, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    iget v5, p0, Lv/VLinear_FillerMeasure;->a:I

    .line 54
    .line 55
    if-eq v5, v2, :cond_4

    .line 56
    .line 57
    move v2, v4

    .line 58
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    iget v6, p0, Lv/VLinear_FillerMeasure;->a:I

    .line 63
    .line 64
    if-ge v4, v5, :cond_3

    .line 65
    .line 66
    if-eq v4, v6, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0, v4, v0, v1}, Lv/VLinear_FillerMeasure;->c(III)I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    sub-int/2addr v0, v5

    .line 73
    add-int/2addr v2, v5

    .line 74
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    invoke-virtual {p0, v6, v0, v1}, Lv/VLinear_FillerMeasure;->c(III)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int v4, v2, v0

    .line 82
    .line 83
    iget v0, p0, Lv/VLinear_FillerMeasure;->a:I

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 90
    .line 91
    .line 92
    :cond_4
    if-lez v4, :cond_5

    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 99
    .line 100
    if-ne v0, v3, :cond_5

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    add-int/2addr v4, p1

    .line 107
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    add-int/2addr v4, p1

    .line 112
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    invoke-virtual {p0, v4, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_5
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_6
    :goto_1
    iget p2, p0, Lv/VLinear_FillerMeasure;->a:I

    .line 133
    .line 134
    if-eq p2, v2, :cond_a

    .line 135
    .line 136
    move p2, v4

    .line 137
    move v1, p2

    .line 138
    move v2, v1

    .line 139
    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    iget v6, p0, Lv/VLinear_FillerMeasure;->a:I

    .line 144
    .line 145
    if-ge p2, v5, :cond_8

    .line 146
    .line 147
    if-eq p2, v6, :cond_7

    .line 148
    .line 149
    invoke-virtual {p0, p2, v0, v4}, Lv/VLinear_FillerMeasure;->c(III)I

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    sub-int/2addr v0, v5

    .line 154
    add-int/2addr v1, v5

    .line 155
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    .line 160
    .line 161
    .line 162
    move-result v5

    .line 163
    if-le v5, v2, :cond_7

    .line 164
    .line 165
    move v2, v5

    .line 166
    :cond_7
    add-int/lit8 p2, p2, 0x1

    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_8
    const/high16 p2, 0x42c80000    # 100.0f

    .line 170
    .line 171
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    invoke-virtual {p0, v6, v0, p2}, Lv/VLinear_FillerMeasure;->c(III)I

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    add-int v4, v1, p2

    .line 180
    .line 181
    iget p2, p0, Lv/VLinear_FillerMeasure;->a:I

    .line 182
    .line 183
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 188
    .line 189
    .line 190
    move-result p2

    .line 191
    if-le p2, v2, :cond_9

    .line 192
    .line 193
    goto :goto_3

    .line 194
    :cond_9
    move p2, v2

    .line 195
    goto :goto_3

    .line 196
    :cond_a
    move p2, v4

    .line 197
    :goto_3
    if-lez v4, :cond_b

    .line 198
    .line 199
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 204
    .line 205
    if-ne v0, v3, :cond_b

    .line 206
    .line 207
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    add-int/2addr v4, p1

    .line 212
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    add-int/2addr v4, p1

    .line 217
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    add-int/2addr p2, p1

    .line 222
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    add-int/2addr p2, p1

    .line 227
    invoke-virtual {p0, v4, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_b
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    add-int/2addr p2, v0

    .line 240
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    add-int/2addr p2, v0

    .line 245
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 246
    .line 247
    .line 248
    return-void
.end method
