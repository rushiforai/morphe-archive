.class public Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->n0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:F

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->e0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->h0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->i0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->k0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Ll/v5w;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    if-nez p1, :cond_4

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/v5w;->getCount()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 v0, 0x2

    .line 31
    if-ge p1, v0, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const/4 v2, 0x0

    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 44
    .line 45
    sub-int/2addr p1, v0

    .line 46
    invoke-virtual {v1, p1, v2}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 v0, 0x1

    .line 51
    sub-int/2addr p1, v0

    .line 52
    if-ne v1, p1, :cond_3

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 55
    .line 56
    invoke-virtual {p1, v0, v2}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 57
    .line 58
    .line 59
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->b0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    if-eqz p1, :cond_4

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->b0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;->a(I)V

    .line 80
    .line 81
    .line 82
    :cond_4
    :goto_1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 2

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->b0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 11
    .line 12
    int-to-float p1, p1

    .line 13
    add-float v0, p1, p2

    .line 14
    .line 15
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->a:F

    .line 16
    .line 17
    cmpl-float v0, v0, v1

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-ltz v0, :cond_1

    .line 21
    .line 22
    move v0, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 v0, 0x0

    .line 25
    :goto_0
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->g0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;Z)V

    .line 26
    .line 27
    .line 28
    const/4 p3, 0x0

    .line 29
    cmpl-float p2, p2, p3

    .line 30
    .line 31
    if-nez p2, :cond_2

    .line 32
    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->a:F

    .line 34
    .line 35
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->c0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->j0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;Z)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 46
    .line 47
    invoke-static {p2}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->e0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-ne p2, v1, :cond_3

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->b0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;->a(I)V

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->f0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->b0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->b0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$b;->b(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->d0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->d0(Lcom/p1/mobile/putong/live/base/view/LoopViewPager;)Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$a;->b:Lcom/p1/mobile/putong/live/base/view/LoopViewPager;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager;->getIndicatorPosition()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LoopViewPager$c;->j(I)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method
