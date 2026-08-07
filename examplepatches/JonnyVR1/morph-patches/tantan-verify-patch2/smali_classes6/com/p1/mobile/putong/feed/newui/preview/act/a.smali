.class public Lcom/p1/mobile/putong/feed/newui/preview/act/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/dg70;",
        ">;",
        "Landroidx/viewpager/widget/ViewPager$j;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VPager;

.field public c:Lv/VPagerCircleIndicator;

.field public d:I

.field public e:Ll/dg70;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ll/wf70;

.field public h:Ll/kxh;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/kxh<",
            "Ll/ixh;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/lang/String;

.field public k:I

.field public l:Ll/jxh;

.field public m:Ll/ixh;

.field public n:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41000000    # 8.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->d:I

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->f:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/preview/act/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->n()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/feed/newui/preview/act/a;Ll/jxh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->l:Ll/jxh;

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fg70;->b(Lcom/p1/mobile/putong/feed/newui/preview/act/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ixh$a;->a()Ll/ixh$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->j:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/ixh$a;->d(Ljava/lang/String;)Ll/ixh$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->e:Ll/dg70;

    .line 12
    .line 13
    iget-object v1, v1, Ll/dg70;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/ixh$a;->e(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/ixh$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->e:Ll/dg70;

    .line 20
    .line 21
    iget-boolean v1, v1, Ll/dg70;->d:Z

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/ixh$a;->f(Z)Ll/ixh$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->e:Ll/dg70;

    .line 28
    .line 29
    iget v1, v1, Ll/dg70;->c:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/ixh$a;->c(I)Ll/ixh$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/ixh$a;->b()Ll/ixh;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->m:Ll/ixh;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->h:Ll/kxh;

    .line 42
    .line 43
    invoke-interface {p0, p1, v0}, Ll/kxh;->c(Landroid/view/View;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/wf70;->e0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->h:Ll/kxh;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->h:Ll/kxh;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/kxh;->onDestroy()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public e(Ll/dg70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->e:Ll/dg70;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lv/VPager;->setScrollble(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public i()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->e:Ll/dg70;

    .line 4
    .line 5
    iget p0, p0, Ll/dg70;->c:I

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

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/dg70;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->e(Ll/dg70;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->n:Landroid/view/View;

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->h:Ll/kxh;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->n:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->d(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->n:Landroid/view/View;

    .line 21
    .line 22
    return-object p0
.end method

.method public final j()Ll/wf70;
    .locals 4

    .line 1
    new-instance v0, Ll/wf70;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->i:Ljava/util/ArrayList;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->e:Ll/dg70;

    .line 8
    .line 9
    iget-object v3, v3, Ll/dg70;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3}, Ll/wf70;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/a4h;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->f:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/a4h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/wf70;->h0(Ll/z3h;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public k(IZ)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->j()Ll/wf70;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->l:Ll/jxh;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->l:Ll/jxh;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 18
    .line 19
    invoke-interface {p2, v0}, Ll/jxh;->b(Ll/cf60;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->m(Lv/VPager;)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->c:Lv/VPagerCircleIndicator;

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->l(ILv/VPagerCircleIndicator;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->p(I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 36
    .line 37
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->l:Ll/jxh;

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Ll/wf70;->g0(Ll/jxh;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 43
    .line 44
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->e:Ll/dg70;

    .line 45
    .line 46
    iget-boolean p2, p2, Ll/dg70;->d:Z

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Ll/wf70;->j0(Z)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->f:Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->f:Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public l(ILv/VPagerCircleIndicator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p2, v0, p1}, Lv/VPagerCircleIndicator;->c(Landroidx/viewpager/widget/ViewPager;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2, p0}, Lv/VPagerCircleIndicator;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    invoke-static {p2, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public m(Lv/VPager;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->a0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 7
    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->d:I

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic n()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->l:Ll/jxh;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->l:Ll/jxh;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 12
    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->k:I

    .line 14
    .line 15
    invoke-interface {v0, v1, v2, p1}, Ll/jxh;->f(Landroidx/viewpager/widget/ViewPager;II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->e:Ll/dg70;

    .line 19
    .line 20
    iput p1, v0, Ll/dg70;->c:I

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ll/wf70;->onPageSelected(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->k:I

    .line 36
    .line 37
    return-void
.end method

.method public p(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/wf70;->onPageSelected(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public q()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->i()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lv/VFrame;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget v1, Ll/hdc0;->L0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v1, v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setOnImageEventListener(Lv/fresco/subscaleview/SubsamplingScaleImageView$h;)V

    .line 25
    .line 26
    .line 27
    const/16 v2, 0x8

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    check-cast v0, Lv/VFrame;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->f:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    new-instance v1, Ll/eg70;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/eg70;-><init>(Lcom/p1/mobile/putong/feed/newui/preview/act/a;)V

    .line 42
    .line 43
    .line 44
    const-wide/16 v2, 0x64

    .line 45
    .line 46
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->m:Ll/ixh;

    .line 2
    .line 3
    iget v1, v0, Ll/ixh;->a:I

    .line 4
    .line 5
    iget-boolean v0, v0, Ll/ixh;->b:Z

    .line 6
    .line 7
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->k(IZ)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->m:Ll/ixh;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->e:Ll/dg70;

    .line 13
    .line 14
    iget-object v1, v1, Ll/dg70;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    iput-object v1, v0, Ll/ixh;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->h:Ll/kxh;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->h:Ll/kxh;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->m:Ll/ixh;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ll/kxh;->i(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->h:Ll/kxh;

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    invoke-interface {p0, v0}, Ll/kxh;->a(Z)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public u(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public v(Ljava/util/ArrayList;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-void
.end method
