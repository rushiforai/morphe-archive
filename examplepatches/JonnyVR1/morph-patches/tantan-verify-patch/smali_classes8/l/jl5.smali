.class public Ll/jl5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/il5;",
        ">;",
        "Landroidx/viewpager/widget/ViewPager$j;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VPager;

.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ll/il5;

.field public e:Ll/ys80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ys80<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/dl5;

.field public g:Ll/pq80;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public i:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jl5;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jl5;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kl5;->b(Ll/jl5;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jl5;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/il5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl5;->d:Ll/il5;

    .line 2
    .line 3
    return-void
.end method

.method public c(I)V
    .locals 3

    .line 1
    new-instance v0, Ll/dl5;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jl5;->c:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/jl5;->h:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/dl5;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/jl5;->f:Ll/dl5;

    .line 11
    .line 12
    new-instance v1, Ll/sae;

    .line 13
    .line 14
    iget-object v2, p0, Ll/jl5;->c:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ll/sae;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/dl5;->x(Ll/rae;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/jl5;->g:Ll/pq80;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/jl5;->g:Ll/pq80;

    .line 31
    .line 32
    iget-object v1, p0, Ll/jl5;->f:Ll/dl5;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ll/pq80;->b(Ll/cf60;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0}, Ll/jl5;->d()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/jl5;->e(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/jl5;->f:Ll/dl5;

    .line 44
    .line 45
    iget-object v1, p0, Ll/jl5;->g:Ll/pq80;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/dl5;->N(Ll/pq80;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/jl5;->f:Ll/dl5;

    .line 51
    .line 52
    iget-object v1, p0, Ll/jl5;->d:Ll/il5;

    .line 53
    .line 54
    iget-boolean v1, v1, Ll/il5;->d:Z

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/dl5;->P(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/jl5;->c:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    iget-object v0, p0, Ll/jl5;->c:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 78
    .line 79
    .line 80
    :cond_1
    if-nez p1, :cond_2

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ll/jl5;->onPageSelected(I)V

    .line 83
    .line 84
    .line 85
    :cond_2
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jl5;->b:Lv/VPager;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->a0(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/jl5;->b:Lv/VPager;

    .line 7
    .line 8
    sget v1, Ll/qa00;->h:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/jl5;->b:Lv/VPager;

    .line 14
    .line 15
    iget-object v1, p0, Ll/jl5;->f:Ll/dl5;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/jl5;->b:Lv/VPager;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jl5;->f:Ll/dl5;

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
    iget-object v0, p0, Ll/jl5;->f:Ll/dl5;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dl5;->M()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/jl5;->e:Ll/ys80;

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
    iget-object p0, p0, Ll/jl5;->e:Ll/ys80;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/ys80;->onDestroy()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/jl5;->b:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/jl5;->f:Ll/dl5;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/dl5;->onPageSelected(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public f(Ll/ys80;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ys80<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jl5;->e:Ll/ys80;

    .line 2
    .line 3
    return-void
.end method

.method public i(Ll/pq80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl5;->g:Ll/pq80;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/il5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jl5;->b(Ll/il5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jl5;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/jl5;->e:Ll/ys80;

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Ll/jl5;->e:Ll/ys80;

    .line 14
    .line 15
    iget-object p0, p0, Ll/jl5;->d:Ll/il5;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/il5;->i0()Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p2, p1, p0}, Ll/ys80;->c(Landroid/view/View;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-object p1
.end method

.method public j(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jl5;->h:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jl5;->f:Ll/dl5;

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
    iget-object p0, p0, Ll/jl5;->f:Ll/dl5;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dl5;->S()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jl5;->g:Ll/pq80;

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
    iget-object v0, p0, Ll/jl5;->g:Ll/pq80;

    .line 10
    .line 11
    iget-object v1, p0, Ll/jl5;->b:Lv/VPager;

    .line 12
    .line 13
    iget v2, p0, Ll/jl5;->i:I

    .line 14
    .line 15
    invoke-interface {v0, v1, v2, p1}, Ll/pq80;->f(Landroidx/viewpager/widget/ViewPager;II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/jl5;->d:Ll/il5;

    .line 19
    .line 20
    iput p1, v0, Ll/il5;->c:I

    .line 21
    .line 22
    iget-object v0, p0, Ll/jl5;->f:Ll/dl5;

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
    iget-object v0, p0, Ll/jl5;->f:Ll/dl5;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ll/dl5;->onPageSelected(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iput p1, p0, Ll/jl5;->i:I

    .line 36
    .line 37
    return-void
.end method
