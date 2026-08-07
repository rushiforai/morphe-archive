.class public Ll/cx00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ax00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VPager;

.field public c:Lv/VPagerCircleIndicator;

.field public d:Ll/ax00;

.field public e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

.field public f:Ljava/lang/String;

.field public g:Ll/vw00;

.field public h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cx00;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/cx00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cx00;->k()V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cx00;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cx00;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dx00;->b(Ll/cx00;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Landroid/view/View;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    return-object p1
.end method

.method public d(Ll/ax00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cx00;->d:Ll/ax00;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e(Landroid/view/View;)Lcom/p1/mobile/putong/feed/ui/PlayerView;
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    check-cast p1, Landroid/view/ViewGroup;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_2

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    instance-of v0, p1, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 30
    .line 31
    return-object p1

    .line 32
    :cond_1
    invoke-virtual {p0, p1}, Ll/cx00;->e(Landroid/view/View;)Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public f()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cx00;->b:Lv/VPager;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cx00;->d:Ll/ax00;

    .line 4
    .line 5
    iget p0, p0, Ll/ax00;->b:I

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public i()Ll/vw00;
    .locals 3

    .line 1
    new-instance v0, Ll/vw00;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cx00;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cx00;->h:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/vw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;Ljava/util/ArrayList;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/a4h;

    .line 11
    .line 12
    iget-object p0, p0, Ll/cx00;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/a4h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/vw00;->D(Ll/z3h;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ax00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cx00;->d(Ll/ax00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cx00;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p1, p2}, Ll/cx00;->c(Landroid/view/View;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public j(IZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/cx00;->i()Ll/vw00;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iput-object p2, p0, Ll/cx00;->g:Ll/vw00;

    .line 6
    .line 7
    iget-object p2, p0, Ll/cx00;->b:Lv/VPager;

    .line 8
    .line 9
    invoke-static {p2}, Ll/bnl0;->a0(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Ll/cx00;->b:Lv/VPager;

    .line 13
    .line 14
    iget-object v0, p0, Ll/cx00;->g:Ll/vw00;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Ll/cx00;->c:Lv/VPagerCircleIndicator;

    .line 20
    .line 21
    iget-object v0, p0, Ll/cx00;->b:Lv/VPager;

    .line 22
    .line 23
    invoke-virtual {p2, v0, p1}, Lv/VPagerCircleIndicator;->c(Landroidx/viewpager/widget/ViewPager;I)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/cx00;->b:Lv/VPager;

    .line 27
    .line 28
    const/high16 v0, 0x41000000    # 8.0f

    .line 29
    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p2, v0}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Ll/cx00;->c:Lv/VPagerCircleIndicator;

    .line 38
    .line 39
    iget-object v0, p0, Ll/cx00;->g:Ll/vw00;

    .line 40
    .line 41
    invoke-virtual {p2, v0}, Lv/VPagerCircleIndicator;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Ll/cx00;->c:Lv/VPagerCircleIndicator;

    .line 45
    .line 46
    iget-object v0, p0, Ll/cx00;->h:Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/4 v1, 0x1

    .line 53
    if-eq v0, v1, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/4 v1, 0x0

    .line 57
    :goto_0
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    if-ltz p1, :cond_1

    .line 61
    .line 62
    iget-object p2, p0, Ll/cx00;->b:Lv/VPager;

    .line 63
    .line 64
    invoke-virtual {p2, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Ll/cx00;->g:Ll/vw00;

    .line 68
    .line 69
    invoke-virtual {p2, p1}, Ll/vw00;->onPageSelected(I)V

    .line 70
    .line 71
    .line 72
    :cond_1
    iget-object p1, p0, Ll/cx00;->b:Lv/VPager;

    .line 73
    .line 74
    new-instance p2, Ll/bx00;

    .line 75
    .line 76
    invoke-direct {p2, p0}, Ll/bx00;-><init>(Ll/cx00;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/cx00;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 83
    .line 84
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_2

    .line 93
    .line 94
    iget-object p0, p0, Ll/cx00;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 101
    .line 102
    .line 103
    :cond_2
    return-void
.end method

.method public final synthetic k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cx00;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/cx00;->b:Lv/VPager;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ltz v0, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ll/cx00;->h:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-lt v0, v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v1, p0, Ll/cx00;->h:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Ll/cx00;->b:Lv/VPager;

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/cx00;->e(Landroid/view/View;)Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/cx00;->l(Lcom/p1/mobile/putong/feed/ui/PlayerView;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/feed/ui/PlayerView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cx00;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-void
.end method
