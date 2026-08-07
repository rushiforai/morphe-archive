.class public final Lcom/p1/mobile/putong/core/view/banner/Banner$b;
.super Landroidx/viewpager2/widget/ViewPager2$i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/view/banner/Banner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\'\u0010\n\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0008\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\u000c\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u000f\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\r\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/view/banner/Banner$b;",
        "Landroidx/viewpager2/widget/ViewPager2$i;",
        "<init>",
        "(Lcom/p1/mobile/putong/core/view/banner/Banner;)V",
        "",
        "position",
        "",
        "positionOffset",
        "positionOffsetPixels",
        "",
        "onPageScrolled",
        "(IFI)V",
        "onPageSelected",
        "(I)V",
        "state",
        "onPageScrollStateChanged",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/view/banner/Banner;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/view/banner/Banner;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/viewpager2/widget/ViewPager2$i;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_2

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/p1/mobile/putong/core/view/banner/Banner;->g(Lcom/p1/mobile/putong/core/view/banner/Banner;)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/banner/Banner;->f(Lcom/p1/mobile/putong/core/view/banner/Banner;)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    sub-int/2addr v2, v0

    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/view/banner/Banner;->j(Lcom/p1/mobile/putong/core/view/banner/Banner;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->h(Lcom/p1/mobile/putong/core/view/banner/Banner;)Landroidx/viewpager2/widget/ViewPager2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/core/view/banner/Banner;->e(Lcom/p1/mobile/putong/core/view/banner/Banner;)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/banner/Banner;->g(Lcom/p1/mobile/putong/core/view/banner/Banner;)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    add-int/2addr v1, v2

    .line 44
    invoke-virtual {v0, v1, v4}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-static {v3}, Lcom/p1/mobile/putong/core/view/banner/Banner;->g(Lcom/p1/mobile/putong/core/view/banner/Banner;)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 53
    .line 54
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/banner/Banner;->e(Lcom/p1/mobile/putong/core/view/banner/Banner;)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 59
    .line 60
    invoke-static {v3}, Lcom/p1/mobile/putong/core/view/banner/Banner;->f(Lcom/p1/mobile/putong/core/view/banner/Banner;)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    add-int/2addr v2, v3

    .line 65
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 66
    .line 67
    if-ne v1, v2, :cond_1

    .line 68
    .line 69
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/view/banner/Banner;->j(Lcom/p1/mobile/putong/core/view/banner/Banner;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->h(Lcom/p1/mobile/putong/core/view/banner/Banner;)Landroidx/viewpager2/widget/ViewPager2;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 79
    .line 80
    invoke-static {v1}, Lcom/p1/mobile/putong/core/view/banner/Banner;->f(Lcom/p1/mobile/putong/core/view/banner/Banner;)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0, v1, v4}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    invoke-static {v3, v0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->j(Lcom/p1/mobile/putong/core/view/banner/Banner;Z)V

    .line 89
    .line 90
    .line 91
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 92
    .line 93
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->a(Lcom/p1/mobile/putong/core/view/banner/Banner;)Landroidx/viewpager2/widget/ViewPager2$i;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    invoke-virtual {v0, p1}, Landroidx/viewpager2/widget/ViewPager2$i;->onPageScrollStateChanged(I)V

    .line 100
    .line 101
    .line 102
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 103
    .line 104
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->b(Lcom/p1/mobile/putong/core/view/banner/Banner;)Ll/aum;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    if-eqz p0, :cond_4

    .line 109
    .line 110
    invoke-interface {p0, p1}, Ll/aum;->onPageScrollStateChanged(I)V

    .line 111
    .line 112
    .line 113
    :cond_4
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/view/banner/Banner;->m(Lcom/p1/mobile/putong/core/view/banner/Banner;I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->a(Lcom/p1/mobile/putong/core/view/banner/Banner;)Landroidx/viewpager2/widget/ViewPager2$i;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2, p3}, Landroidx/viewpager2/widget/ViewPager2$i;->onPageScrolled(IFI)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->b(Lcom/p1/mobile/putong/core/view/banner/Banner;)Ll/aum;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-interface {p0, p1, p2, p3}, Ll/aum;->onPageScrolled(IFI)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->e(Lcom/p1/mobile/putong/core/view/banner/Banner;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/view/banner/Banner;->k(Lcom/p1/mobile/putong/core/view/banner/Banner;I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->i(Lcom/p1/mobile/putong/core/view/banner/Banner;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 24
    .line 25
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/view/banner/Banner;->m(Lcom/p1/mobile/putong/core/view/banner/Banner;I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->a(Lcom/p1/mobile/putong/core/view/banner/Banner;)Landroidx/viewpager2/widget/ViewPager2$i;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroidx/viewpager2/widget/ViewPager2$i;->onPageSelected(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$b;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->b(Lcom/p1/mobile/putong/core/view/banner/Banner;)Ll/aum;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-interface {p0, p1}, Ll/aum;->onPageSelected(I)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method
