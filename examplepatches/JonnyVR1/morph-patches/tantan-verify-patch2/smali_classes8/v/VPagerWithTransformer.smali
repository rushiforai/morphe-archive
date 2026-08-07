.class public Lv/VPagerWithTransformer;
.super Landroidx/viewpager/widget/ViewPager;
.source "SourceFile"


# instance fields
.field public M0:Landroidx/viewpager/widget/ViewPager$k;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public X(ZLandroidx/viewpager/widget/ViewPager$k;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;->X(ZLandroidx/viewpager/widget/ViewPager$k;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lv/VPagerWithTransformer;->M0:Landroidx/viewpager/widget/ViewPager$k;

    .line 5
    .line 6
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 2

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/viewpager/widget/ViewPager;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lv/VPagerWithTransformer;->M0:Landroidx/viewpager/widget/ViewPager$k;

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    const/4 p3, 0x0

    .line 17
    :goto_0
    if-ge p3, p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object p5

    .line 27
    check-cast p5, Landroidx/viewpager/widget/ViewPager$g;

    .line 28
    .line 29
    iget-boolean p5, p5, Landroidx/viewpager/widget/ViewPager$g;->a:Z

    .line 30
    .line 31
    if-eqz p5, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    invoke-virtual {p4}, Landroid/view/View;->getLeft()I

    .line 35
    .line 36
    .line 37
    move-result p5

    .line 38
    sub-int/2addr p5, p1

    .line 39
    int-to-float p5, p5

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    sub-int/2addr v0, v1

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    sub-int/2addr v0, v1

    .line 54
    int-to-float v0, v0

    .line 55
    div-float/2addr p5, v0

    .line 56
    iget-object v0, p0, Lv/VPagerWithTransformer;->M0:Landroidx/viewpager/widget/ViewPager$k;

    .line 57
    .line 58
    invoke-interface {v0, p4, p5}, Landroidx/viewpager/widget/ViewPager$k;->a(Landroid/view/View;F)V

    .line 59
    .line 60
    .line 61
    :goto_1
    add-int/lit8 p3, p3, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    return-void
.end method
