.class public Lv/VSlidingTabs$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VSlidingTabs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Lv/VSlidingTabs;


# direct methods
.method public constructor <init>(Lv/VSlidingTabs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lv/VSlidingTabs;Ll/qzk0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lv/VSlidingTabs$a;-><init>(Lv/VSlidingTabs;)V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 1

    .line 1
    iput p1, p0, Lv/VSlidingTabs$a;->a:I

    .line 2
    .line 3
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 4
    .line 5
    invoke-static {v0}, Lv/VSlidingTabs;->e(Lv/VSlidingTabs;)Landroidx/viewpager/widget/ViewPager$j;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 12
    .line 13
    invoke-static {p0}, Lv/VSlidingTabs;->e(Lv/VSlidingTabs;)Landroidx/viewpager/widget/ViewPager$j;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0, p1}, Landroidx/viewpager/widget/ViewPager$j;->onPageScrollStateChanged(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 2
    .line 3
    invoke-static {v0}, Lv/VSlidingTabs;->b(Lv/VSlidingTabs;)Lv/VSlidingTabStrip;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    if-ltz p1, :cond_2

    .line 14
    .line 15
    if-lt p1, v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 19
    .line 20
    invoke-static {v0}, Lv/VSlidingTabs;->b(Lv/VSlidingTabs;)Lv/VSlidingTabStrip;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, p1, p2}, Lv/VSlidingTabStrip;->a(IF)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 28
    .line 29
    invoke-static {v0}, Lv/VSlidingTabs;->b(Lv/VSlidingTabs;)Lv/VSlidingTabStrip;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    int-to-float v0, v0

    .line 44
    mul-float/2addr v0, p2

    .line 45
    float-to-int v0, v0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v0, 0x0

    .line 48
    :goto_0
    iget-object v1, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 49
    .line 50
    invoke-static {v1, p1, p2, v0}, Lv/VSlidingTabs;->h(Lv/VSlidingTabs;IFI)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 54
    .line 55
    invoke-static {v0}, Lv/VSlidingTabs;->e(Lv/VSlidingTabs;)Landroidx/viewpager/widget/ViewPager$j;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object p0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 62
    .line 63
    invoke-static {p0}, Lv/VSlidingTabs;->e(Lv/VSlidingTabs;)Landroidx/viewpager/widget/ViewPager$j;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-interface {p0, p1, p2, p3}, Landroidx/viewpager/widget/ViewPager$j;->onPageScrolled(IFI)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    .line 1
    iget v0, p0, Lv/VSlidingTabs$a;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 7
    .line 8
    invoke-static {v0}, Lv/VSlidingTabs;->b(Lv/VSlidingTabs;)Lv/VSlidingTabStrip;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, p1, v2}, Lv/VSlidingTabStrip;->a(IF)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 17
    .line 18
    invoke-static {v0, p1, v2, v1}, Lv/VSlidingTabs;->h(Lv/VSlidingTabs;IFI)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 22
    .line 23
    iget-boolean v0, v0, Lv/VSlidingTabs;->j:Z

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    :goto_0
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 28
    .line 29
    invoke-static {v0}, Lv/VSlidingTabs;->b(Lv/VSlidingTabs;)Lv/VSlidingTabStrip;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-ge v1, v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 40
    .line 41
    invoke-static {v0}, Lv/VSlidingTabs;->b(Lv/VSlidingTabs;)Lv/VSlidingTabStrip;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v2, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 50
    .line 51
    invoke-static {v2}, Lv/VSlidingTabs;->c(Lv/VSlidingTabs;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Landroid/widget/TextView;

    .line 60
    .line 61
    iget-object v2, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 62
    .line 63
    if-ne v1, p1, :cond_1

    .line 64
    .line 65
    invoke-static {v2}, Lv/VSlidingTabs;->f(Lv/VSlidingTabs;)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    invoke-static {v2}, Lv/VSlidingTabs;->g(Lv/VSlidingTabs;)I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    iget-object v0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 84
    .line 85
    invoke-static {v0}, Lv/VSlidingTabs;->e(Lv/VSlidingTabs;)Landroidx/viewpager/widget/ViewPager$j;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    iget-object p0, p0, Lv/VSlidingTabs$a;->b:Lv/VSlidingTabs;

    .line 92
    .line 93
    invoke-static {p0}, Lv/VSlidingTabs;->e(Lv/VSlidingTabs;)Landroidx/viewpager/widget/ViewPager$j;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {p0, p1}, Landroidx/viewpager/widget/ViewPager$j;->onPageSelected(I)V

    .line 98
    .line 99
    .line 100
    :cond_3
    return-void
.end method
