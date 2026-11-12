.class public Lcom/opera/android/custom_views/LayoutDirectionViewPager;
.super Landroidx/viewpager/widget/ViewPager;
.source "SourceFile"

# interfaces
.implements Lk2c;


# instance fields
.field public a:Lh2c;

.field public final b:Ll2c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ll2c;

    invoke-direct {p1, p0, p0, p2}, Ll2c;-><init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V

    iput-object p1, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->b:Ll2c;

    return-void
.end method


# virtual methods
.method public final b()Ll2c;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->b:Ll2c;

    return-object p0
.end method

.method public final i(I)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->a:Lh2c;

    if-eqz p0, :cond_e

    const/4 v0, 0x1

    if-eq p1, v0, :cond_8

    const/4 v0, 0x0

    :cond_8
    iget-boolean p1, p0, Lh2c;->b:Z

    if-eq p1, v0, :cond_e

    iput-boolean v0, p0, Lh2c;->b:Z

    :cond_e
    return-void
.end method

.method public final q()I
    .registers 2

    invoke-super {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result p0

    return p0
.end method

.method public final r(I)I
    .registers 3

    iget-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->b:Ll2c;

    invoke-virtual {v0}, Ll2c;->b()Z

    move-result v0

    if-nez v0, :cond_9

    return p1

    :cond_9
    iget-object p0, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->a:Lh2c;

    iget-object p0, p0, Lh2c;->a:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {p0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    sub-int/2addr p0, p1

    return p0
.end method

.method public setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V
    .registers 5

    instance-of v0, p1, Lh2c;

    if-eqz v0, :cond_a

    move-object v0, p1

    check-cast v0, Lh2c;

    iput-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->a:Lh2c;

    goto :goto_17

    :cond_a
    if-eqz p1, :cond_14

    new-instance v0, Lh2c;

    invoke-direct {v0, p1}, Lh2c;-><init>(Landroidx/viewpager/widget/PagerAdapter;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->a:Lh2c;

    goto :goto_17

    :cond_14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->a:Lh2c;

    :goto_17
    if-eqz v0, :cond_25

    iget-object v1, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->b:Ll2c;

    invoke-virtual {v1}, Ll2c;->b()Z

    move-result v1

    iget-boolean v2, v0, Lh2c;->b:Z

    if-eq v2, v1, :cond_25

    iput-boolean v1, v0, Lh2c;->b:Z

    :cond_25
    iget-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->a:Lh2c;

    invoke-super {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    if-eqz p1, :cond_33

    invoke-virtual {p0}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->q()I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    :cond_33
    return-void
.end method
