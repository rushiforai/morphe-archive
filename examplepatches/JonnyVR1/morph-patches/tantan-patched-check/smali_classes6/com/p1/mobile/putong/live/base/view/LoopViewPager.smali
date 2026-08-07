.class public Lcom/p1/mobile/putong/live/base/view/LoopViewPager;
.super Landroidx/viewpager/widget/ViewPager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;,
        Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;
    }
.end annotation


# instance fields
.field public M0:I

.field public N0:I

.field public O0:I

.field public P0:Z

.field public Q0:Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;

.field public R0:Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/viewpager/widget/ViewPager;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->M0:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->N0:I

    .line 8
    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->O0:I

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->P0:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->n0()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->M0:I

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->N0:I

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->O0:I

    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->P0:Z

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->n0()V

    return-void
.end method

.method public static bridge synthetic b0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->Q0:Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;

    return-object p0
.end method

.method public static bridge synthetic c0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->P0:Z

    return p0
.end method

.method public static bridge synthetic d0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->R0:Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;

    return-object p0
.end method

.method public static bridge synthetic e0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->O0:I

    return p0
.end method

.method public static bridge synthetic f0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->M0:I

    return-void
.end method

.method public static bridge synthetic g0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->P0:Z

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->N0:I

    return-void
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->O0:I

    return-void
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;Z)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->m0(Z)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Ll/v5w;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->o0()Ll/v5w;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getIndicatorCount()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->o0()Ll/v5w;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/v5w;->k()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public getIndicatorPosition()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->o0()Ll/v5w;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->M0:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    if-nez v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/v5w;->k()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    :goto_0
    add-int/lit8 p0, p0, -0x1

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    invoke-virtual {v0}, Ll/v5w;->m()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    if-ne v1, v0, :cond_2

    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_2
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->M0:I

    .line 30
    .line 31
    goto :goto_0
.end method

.method public l0(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->o0()Ll/v5w;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0, p1}, Ll/v5w;->n(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final m0(Z)I
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->O0:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eq v0, v1, :cond_5

    .line 5
    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->N0:I

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    if-ne v2, v1, :cond_0

    .line 12
    .line 13
    if-ne v0, v3, :cond_0

    .line 14
    .line 15
    goto :goto_2

    .line 16
    :cond_0
    if-eqz p1, :cond_1

    .line 17
    .line 18
    move v0, v3

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 v0, -0x1

    .line 21
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->o0()Ll/v5w;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->M0:I

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    add-int/2addr v2, v0

    .line 30
    return v2

    .line 31
    :cond_2
    if-ne v2, v3, :cond_3

    .line 32
    .line 33
    if-nez p1, :cond_3

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/v5w;->m()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    :goto_1
    sub-int/2addr p0, v3

    .line 40
    return p0

    .line 41
    :cond_3
    invoke-virtual {v1}, Ll/v5w;->m()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-ne v2, v1, :cond_4

    .line 46
    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return p0

    .line 51
    :cond_4
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->M0:I

    .line 52
    .line 53
    add-int/2addr p0, v0

    .line 54
    goto :goto_1

    .line 55
    :cond_5
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0
.end method

.method public n0()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;-><init>(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final o0()Ll/v5w;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/v5w;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/v5w;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public setAdapter(Ll/cf60;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    instance-of v0, p1, Ll/v5w;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p0, "LoopViewPager must use LoopPagerAdapter or its subClass"

    .line 9
    .line 10
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eq p1, v0, :cond_3

    .line 21
    .line 22
    :cond_2
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->M0:I

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->P0:Z

    .line 27
    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->N0:I

    .line 29
    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->O0:I

    .line 31
    .line 32
    :cond_3
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setIndicatorPageChangeListener(Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->Q0:Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;

    .line 2
    .line 3
    return-void
.end method

.method public setPageShowListener(Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->R0:Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;

    .line 2
    .line 3
    return-void
.end method
