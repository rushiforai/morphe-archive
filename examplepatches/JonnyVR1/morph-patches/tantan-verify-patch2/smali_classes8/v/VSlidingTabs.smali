.class public Lv/VSlidingTabs;
.super Lv/VScroll_Horizontal;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/VSlidingTabs$c;,
        Lv/VSlidingTabs$a;,
        Lv/VSlidingTabs$b;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Landroidx/viewpager/widget/ViewPager;

.field public g:Landroidx/viewpager/widget/ViewPager$j;

.field public final h:Lv/VSlidingTabStrip;

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, v0}, Lv/VSlidingTabs;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 45
    invoke-direct {p0, p1, p2, v0}, Lv/VSlidingTabs;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VScroll_Horizontal;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lv/VSlidingTabs;->i:Z

    .line 6
    .line 7
    iput-boolean p2, p0, Lv/VSlidingTabs;->j:Z

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 10
    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-virtual {p0, p2}, Landroid/widget/HorizontalScrollView;->setFillViewport(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    .line 25
    .line 26
    const/high16 p3, 0x41c00000    # 24.0f

    .line 27
    .line 28
    mul-float/2addr p2, p3

    .line 29
    float-to-int p2, p2

    .line 30
    iput p2, p0, Lv/VSlidingTabs;->c:I

    .line 31
    .line 32
    new-instance p2, Lv/VSlidingTabStrip;

    .line 33
    .line 34
    invoke-direct {p2, p1}, Lv/VSlidingTabStrip;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    iput-object p2, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 38
    .line 39
    const/4 p1, -0x1

    .line 40
    const/4 p3, -0x2

    .line 41
    invoke-virtual {p0, p2, p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static bridge synthetic b(Lv/VSlidingTabs;)Lv/VSlidingTabStrip;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    return-object p0
.end method

.method public static bridge synthetic c(Lv/VSlidingTabs;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/VSlidingTabs;->e:I

    return p0
.end method

.method public static bridge synthetic d(Lv/VSlidingTabs;)Landroidx/viewpager/widget/ViewPager;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSlidingTabs;->f:Landroidx/viewpager/widget/ViewPager;

    return-object p0
.end method

.method public static bridge synthetic e(Lv/VSlidingTabs;)Landroidx/viewpager/widget/ViewPager$j;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSlidingTabs;->g:Landroidx/viewpager/widget/ViewPager$j;

    return-object p0
.end method

.method public static bridge synthetic f(Lv/VSlidingTabs;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/VSlidingTabs;->a:I

    return p0
.end method

.method public static bridge synthetic g(Lv/VSlidingTabs;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/VSlidingTabs;->b:I

    return p0
.end method

.method public static bridge synthetic h(Lv/VSlidingTabs;IFI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lv/VSlidingTabs;->k(IFI)V

    return-void
.end method


# virtual methods
.method public getTabStrip()Lv/VSlidingTabStrip;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Landroid/content/Context;)Landroid/widget/TextView;
    .locals 4

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x11

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x2

    .line 12
    const/high16 v1, 0x41400000    # 12.0f

    .line 13
    .line 14
    invoke-virtual {v0, p1, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Landroid/util/TypedValue;

    .line 23
    .line 24
    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const v2, 0x101030e

    .line 36
    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    invoke-virtual {v1, v2, p1, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 40
    .line 41
    .line 42
    iget p1, p1, Landroid/util/TypedValue;->resourceId:I

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 59
    .line 60
    const/high16 p1, 0x41800000    # 16.0f

    .line 61
    .line 62
    mul-float/2addr p0, p1

    .line 63
    float-to-int p0, p0

    .line 64
    invoke-virtual {v0, p0, p0, p0, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 65
    .line 66
    .line 67
    return-object v0
.end method

.method public final j()V
    .locals 8

    .line 1
    iget-object v0, p0, Lv/VSlidingTabs;->f:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lv/VSlidingTabs$b;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v1, p0, v2}, Lv/VSlidingTabs$b;-><init>(Lv/VSlidingTabs;Ll/qzk0;)V

    .line 11
    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    move v4, v3

    .line 15
    :goto_0
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    if-ge v4, v5, :cond_4

    .line 20
    .line 21
    iget v5, p0, Lv/VSlidingTabs;->d:I

    .line 22
    .line 23
    if-eqz v5, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    iget v6, p0, Lv/VSlidingTabs;->d:I

    .line 34
    .line 35
    iget-object v7, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 36
    .line 37
    invoke-virtual {v5, v6, v7, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    iget v6, p0, Lv/VSlidingTabs;->e:I

    .line 42
    .line 43
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    check-cast v6, Landroid/widget/TextView;

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    move-object v5, v2

    .line 51
    move-object v6, v5

    .line 52
    :goto_1
    if-nez v5, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-virtual {p0, v5}, Lv/VSlidingTabs;->i(Landroid/content/Context;)Landroid/widget/TextView;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    :cond_1
    if-nez v6, :cond_2

    .line 63
    .line 64
    const-class v7, Landroid/widget/TextView;

    .line 65
    .line 66
    invoke-virtual {v7, v5}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    if-eqz v7, :cond_2

    .line 71
    .line 72
    move-object v6, v5

    .line 73
    check-cast v6, Landroid/widget/TextView;

    .line 74
    .line 75
    :cond_2
    iget-object v7, p0, Lv/VSlidingTabs;->f:Landroidx/viewpager/widget/ViewPager;

    .line 76
    .line 77
    invoke-virtual {v7}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    if-ne v4, v7, :cond_3

    .line 82
    .line 83
    iget v7, p0, Lv/VSlidingTabs;->a:I

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_3
    iget v7, p0, Lv/VSlidingTabs;->b:I

    .line 87
    .line 88
    :goto_2
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v4}, Ll/cf60;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v5, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    iget-object v6, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 102
    .line 103
    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 104
    .line 105
    .line 106
    add-int/lit8 v4, v4, 0x1

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_4
    return-void
.end method

.method public final k(IFI)V
    .locals 6

    .line 1
    iget-object v0, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_6

    .line 8
    .line 9
    if-ltz p1, :cond_6

    .line 10
    .line 11
    if-lt p1, v0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    iget-boolean v0, p0, Lv/VSlidingTabs;->i:Z

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    move v0, v1

    .line 20
    :goto_0
    iget-object v2, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v0, v2, :cond_3

    .line 27
    .line 28
    iget-object v2, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget v3, p0, Lv/VSlidingTabs;->e:I

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Landroid/widget/TextView;

    .line 41
    .line 42
    if-ne v0, p1, :cond_1

    .line 43
    .line 44
    iget v3, p0, Lv/VSlidingTabs;->a:I

    .line 45
    .line 46
    iget v4, p0, Lv/VSlidingTabs;->b:I

    .line 47
    .line 48
    const/high16 v5, 0x3f800000    # 1.0f

    .line 49
    .line 50
    sub-float/2addr v5, p2

    .line 51
    invoke-static {v3, v4, v5}, Ll/ye5;->a(IIF)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    add-int/lit8 v3, p1, 0x1

    .line 60
    .line 61
    if-ne v0, v3, :cond_2

    .line 62
    .line 63
    iget v3, p0, Lv/VSlidingTabs;->a:I

    .line 64
    .line 65
    iget v4, p0, Lv/VSlidingTabs;->b:I

    .line 66
    .line 67
    invoke-static {v3, v4, p2}, Ll/ye5;->a(IIF)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    iget v3, p0, Lv/VSlidingTabs;->b:I

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    iget-object p2, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 84
    .line 85
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    if-eqz p2, :cond_6

    .line 90
    .line 91
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    add-int/2addr p2, p3

    .line 96
    if-gtz p1, :cond_4

    .line 97
    .line 98
    if-lez p3, :cond_5

    .line 99
    .line 100
    :cond_4
    iget p1, p0, Lv/VSlidingTabs;->c:I

    .line 101
    .line 102
    sub-int/2addr p2, p1

    .line 103
    :cond_5
    invoke-virtual {p0, p2, v1}, Landroid/view/View;->scrollTo(II)V

    .line 104
    .line 105
    .line 106
    :cond_6
    :goto_2
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/VSlidingTabs;->f:Landroidx/viewpager/widget/ViewPager;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p0, v0, v1, v2}, Lv/VSlidingTabs;->k(IFI)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setCustomTabColorizer(Lv/VSlidingTabs$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VSlidingTabStrip;->setCustomTabColorizer(Lv/VSlidingTabs$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public varargs setDividerColors([I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VSlidingTabStrip;->setDividerColors([I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSlidingTabs;->g:Landroidx/viewpager/widget/ViewPager$j;

    .line 2
    .line 3
    return-void
.end method

.method public varargs setSelectedIndicatorColors([I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VSlidingTabStrip;->setSelectedIndicatorColors([I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setViewPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VSlidingTabs;->h:Lv/VSlidingTabStrip;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lv/VSlidingTabs;->f:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    new-instance v0, Lv/VSlidingTabs$a;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Lv/VSlidingTabs$a;-><init>(Lv/VSlidingTabs;Ll/qzk0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lv/VSlidingTabs;->j()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
