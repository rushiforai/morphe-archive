.class public Ll/rsf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# static fields
.field public static b:I = 0x0

.field public static c:I = 0x1

.field public static d:F

.field public static final e:F

.field public static final f:F


# instance fields
.field public a:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    sput v0, Ll/rsf0;->d:F

    .line 12
    .line 13
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/rsf0;->k(F)F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    div-float v1, v0, v1

    .line 20
    .line 21
    sput v1, Ll/rsf0;->e:F

    .line 22
    .line 23
    invoke-static {v0}, Ll/rsf0;->k(F)F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    mul-float/2addr v1, v2

    .line 28
    sub-float/2addr v0, v1

    .line 29
    sput v0, Ll/rsf0;->f:F

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/rsf0;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public static a(Landroid/view/View;Landroid/graphics/PointF;Z)Z
    .locals 8
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->canScrollVertically(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    instance-of v1, p0, Landroid/view/ViewGroup;

    .line 17
    .line 18
    if-eqz v1, :cond_4

    .line 19
    .line 20
    if-eqz p1, :cond_4

    .line 21
    .line 22
    invoke-static {p0}, Ll/rsf0;->f(Landroid/view/View;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_4

    .line 27
    .line 28
    move-object v1, p0

    .line 29
    check-cast v1, Landroid/view/ViewGroup;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    new-instance v4, Landroid/graphics/PointF;

    .line 36
    .line 37
    invoke-direct {v4}, Landroid/graphics/PointF;-><init>()V

    .line 38
    .line 39
    .line 40
    :goto_0
    if-lez v3, :cond_4

    .line 41
    .line 42
    add-int/lit8 v5, v3, -0x1

    .line 43
    .line 44
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    iget v6, p1, Landroid/graphics/PointF;->x:F

    .line 49
    .line 50
    iget v7, p1, Landroid/graphics/PointF;->y:F

    .line 51
    .line 52
    invoke-static {v1, v5, v6, v7, v4}, Ll/rsf0;->g(Landroid/view/View;Landroid/view/View;FFLandroid/graphics/PointF;)Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    if-eqz v6, :cond_3

    .line 57
    .line 58
    sget p0, Ll/vcc0;->J0:I

    .line 59
    .line 60
    invoke-virtual {v5, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string v0, "fixed"

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_2

    .line 71
    .line 72
    const-string v0, "fixed-top"

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_1

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    iget p0, v4, Landroid/graphics/PointF;->x:F

    .line 82
    .line 83
    iget v0, v4, Landroid/graphics/PointF;->y:F

    .line 84
    .line 85
    invoke-virtual {p1, p0, v0}, Landroid/graphics/PointF;->offset(FF)V

    .line 86
    .line 87
    .line 88
    invoke-static {v5, p1, p2}, Ll/rsf0;->a(Landroid/view/View;Landroid/graphics/PointF;Z)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    iget p2, v4, Landroid/graphics/PointF;->x:F

    .line 93
    .line 94
    neg-float p2, p2

    .line 95
    iget v0, v4, Landroid/graphics/PointF;->y:F

    .line 96
    .line 97
    neg-float v0, v0

    .line 98
    invoke-virtual {p1, p2, v0}, Landroid/graphics/PointF;->offset(FF)V

    .line 99
    .line 100
    .line 101
    return p0

    .line 102
    :cond_2
    :goto_1
    return v2

    .line 103
    :cond_3
    add-int/lit8 v3, v3, -0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_4
    if-nez p2, :cond_6

    .line 107
    .line 108
    const/4 p1, -0x1

    .line 109
    invoke-virtual {p0, p1}, Landroid/view/View;->canScrollVertically(I)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_5

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_5
    return v2

    .line 117
    :cond_6
    :goto_2
    return v0
.end method

.method public static b(Landroid/view/View;Landroid/graphics/PointF;)Z
    .locals 6
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->canScrollVertically(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 17
    .line 18
    if-eqz v0, :cond_4

    .line 19
    .line 20
    if-eqz p1, :cond_4

    .line 21
    .line 22
    check-cast p0, Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    new-instance v2, Landroid/graphics/PointF;

    .line 29
    .line 30
    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    .line 31
    .line 32
    .line 33
    :goto_0
    if-lez v0, :cond_4

    .line 34
    .line 35
    add-int/lit8 v3, v0, -0x1

    .line 36
    .line 37
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget v4, p1, Landroid/graphics/PointF;->x:F

    .line 42
    .line 43
    iget v5, p1, Landroid/graphics/PointF;->y:F

    .line 44
    .line 45
    invoke-static {p0, v3, v4, v5, v2}, Ll/rsf0;->g(Landroid/view/View;Landroid/view/View;FFLandroid/graphics/PointF;)Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_3

    .line 50
    .line 51
    sget p0, Ll/vcc0;->J0:I

    .line 52
    .line 53
    invoke-virtual {v3, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v0, "fixed"

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    const-string v0, "fixed-bottom"

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    iget p0, v2, Landroid/graphics/PointF;->x:F

    .line 75
    .line 76
    iget v0, v2, Landroid/graphics/PointF;->y:F

    .line 77
    .line 78
    invoke-virtual {p1, p0, v0}, Landroid/graphics/PointF;->offset(FF)V

    .line 79
    .line 80
    .line 81
    invoke-static {v3, p1}, Ll/rsf0;->b(Landroid/view/View;Landroid/graphics/PointF;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    iget v0, v2, Landroid/graphics/PointF;->x:F

    .line 86
    .line 87
    neg-float v0, v0

    .line 88
    iget v1, v2, Landroid/graphics/PointF;->y:F

    .line 89
    .line 90
    neg-float v1, v1

    .line 91
    invoke-virtual {p1, v0, v1}, Landroid/graphics/PointF;->offset(FF)V

    .line 92
    .line 93
    .line 94
    return p0

    .line 95
    :cond_2
    :goto_1
    return v1

    .line 96
    :cond_3
    add-int/lit8 v0, v0, -0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_4
    const/4 p0, 0x1

    .line 100
    return p0
.end method

.method public static c(F)I
    .locals 1

    .line 1
    sget v0, Ll/rsf0;->d:F

    .line 2
    .line 3
    mul-float/2addr p0, v0

    .line 4
    const/high16 v0, 0x3f000000    # 0.5f

    .line 5
    .line 6
    add-float/2addr p0, v0

    .line 7
    float-to-int p0, p0

    .line 8
    return p0
.end method

.method public static d(Landroid/view/View;I)V
    .locals 2

    .line 1
    instance-of v0, p0, Landroid/widget/ScrollView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Landroid/widget/ScrollView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/ScrollView;->fling(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    instance-of v0, p0, Landroid/widget/AbsListView;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    check-cast p0, Landroid/widget/AbsListView;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/AbsListView;->fling(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    instance-of v0, p0, Landroid/webkit/WebView;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    check-cast p0, Landroid/webkit/WebView;

    .line 27
    .line 28
    invoke-virtual {p0, v1, p1}, Landroid/webkit/WebView;->flingScroll(II)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    instance-of v0, p0, Landroidx/core/widget/NestedScrollView;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    check-cast p0, Landroidx/core/widget/NestedScrollView;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroidx/core/widget/NestedScrollView;->p(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_3
    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    invoke-virtual {p0, v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->fling(II)Z

    .line 49
    .line 50
    .line 51
    :cond_4
    return-void
.end method

.method public static e(Landroid/view/View;)Z
    .locals 2

    .line 1
    instance-of v0, p0, Ll/gvc0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-static {p0}, Ll/rsf0;->f(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    instance-of v0, p0, Landroidx/viewpager/widget/ViewPager;

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    instance-of p0, p0, Ll/ei20;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    return v1

    .line 23
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public static f(Landroid/view/View;)Z
    .locals 2

    .line 1
    instance-of v0, p0, Ll/gvc0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    instance-of v0, p0, Landroid/widget/AbsListView;

    .line 8
    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    instance-of v0, p0, Landroid/widget/ScrollView;

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    instance-of v0, p0, Ll/mee0;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    instance-of v0, p0, Landroid/webkit/WebView;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    instance-of p0, p0, Ll/ai20;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return v1

    .line 29
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public static g(Landroid/view/View;Landroid/view/View;FFLandroid/graphics/PointF;)Z
    .locals 6
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const/4 v0, 0x2

    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    aput p2, v0, v1

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aput p3, v0, v2

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    sub-int/2addr v3, v4

    .line 26
    int-to-float v3, v3

    .line 27
    add-float/2addr v3, p2

    .line 28
    aput v3, v0, v1

    .line 29
    .line 30
    aget v3, v0, v2

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    sub-int/2addr p0, v4

    .line 41
    int-to-float p0, p0

    .line 42
    add-float/2addr v3, p0

    .line 43
    aput v3, v0, v2

    .line 44
    .line 45
    aget p0, v0, v1

    .line 46
    .line 47
    const/4 v4, 0x0

    .line 48
    cmpl-float v5, p0, v4

    .line 49
    .line 50
    if-ltz v5, :cond_1

    .line 51
    .line 52
    cmpl-float v3, v3, v4

    .line 53
    .line 54
    if-ltz v3, :cond_1

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    int-to-float v3, v3

    .line 61
    cmpg-float p0, p0, v3

    .line 62
    .line 63
    if-gez p0, :cond_1

    .line 64
    .line 65
    aget p0, v0, v2

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    int-to-float p1, p1

    .line 72
    cmpg-float p0, p0, p1

    .line 73
    .line 74
    if-gez p0, :cond_1

    .line 75
    .line 76
    move p0, v2

    .line 77
    goto :goto_0

    .line 78
    :cond_1
    move p0, v1

    .line 79
    :goto_0
    if-eqz p0, :cond_2

    .line 80
    .line 81
    if-eqz p4, :cond_2

    .line 82
    .line 83
    aget p1, v0, v1

    .line 84
    .line 85
    sub-float/2addr p1, p2

    .line 86
    aget p2, v0, v2

    .line 87
    .line 88
    sub-float/2addr p2, p3

    .line 89
    invoke-virtual {p4, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 90
    .line 91
    .line 92
    :cond_2
    return p0
.end method

.method public static h(Landroid/view/View;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    const/4 v2, -0x2

    .line 11
    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {v2, v2, v1}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 22
    .line 23
    if-lez v0, :cond_1

    .line 24
    .line 25
    const/high16 v2, 0x40000000    # 2.0f

    .line 26
    .line 27
    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    :goto_0
    invoke-virtual {p0, v1, v0}, Landroid/view/View;->measure(II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method

.method public static i(I)F
    .locals 1

    .line 1
    int-to-float p0, p0

    .line 2
    sget v0, Ll/rsf0;->d:F

    .line 3
    .line 4
    div-float/2addr p0, v0

    .line 5
    return p0
.end method

.method public static j(Landroid/widget/AbsListView;I)V
    .locals 0
    .param p0    # Landroid/widget/AbsListView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/AbsListView;->scrollListBy(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static k(F)F
    .locals 3

    .line 1
    const/high16 v0, 0x41000000    # 8.0f

    .line 2
    .line 3
    mul-float/2addr p0, v0

    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    cmpg-float v1, p0, v0

    .line 7
    .line 8
    if-gez v1, :cond_0

    .line 9
    .line 10
    neg-float v1, p0

    .line 11
    float-to-double v1, v1

    .line 12
    invoke-static {v1, v2}, Ljava/lang/Math;->exp(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    double-to-float v1, v1

    .line 17
    sub-float/2addr v0, v1

    .line 18
    sub-float/2addr p0, v0

    .line 19
    return p0

    .line 20
    :cond_0
    sub-float p0, v0, p0

    .line 21
    .line 22
    float-to-double v1, p0

    .line 23
    invoke-static {v1, v2}, Ljava/lang/Math;->exp(D)D

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    double-to-float p0, v1

    .line 28
    sub-float/2addr v0, p0

    .line 29
    const p0, 0x3f21d2a7

    .line 30
    .line 31
    .line 32
    mul-float/2addr v0, p0

    .line 33
    const p0, 0x3ebc5ab2

    .line 34
    .line 35
    .line 36
    add-float/2addr v0, p0

    .line 37
    return v0
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 1

    .line 1
    iget p0, p0, Ll/rsf0;->a:I

    .line 2
    .line 3
    sget v0, Ll/rsf0;->c:I

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    sub-float p1, p0, p1

    .line 10
    .line 11
    mul-float/2addr p1, p1

    .line 12
    sub-float/2addr p0, p1

    .line 13
    return p0

    .line 14
    :cond_0
    sget p0, Ll/rsf0;->e:F

    .line 15
    .line 16
    invoke-static {p1}, Ll/rsf0;->k(F)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    mul-float/2addr p0, p1

    .line 21
    const/4 p1, 0x0

    .line 22
    cmpl-float p1, p0, p1

    .line 23
    .line 24
    if-lez p1, :cond_1

    .line 25
    .line 26
    sget p1, Ll/rsf0;->f:F

    .line 27
    .line 28
    add-float/2addr p0, p1

    .line 29
    :cond_1
    return p0
.end method
