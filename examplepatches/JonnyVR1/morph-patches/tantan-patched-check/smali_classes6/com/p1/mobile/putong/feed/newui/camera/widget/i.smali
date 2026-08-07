.class public final Lcom/p1/mobile/putong/feed/newui/camera/widget/i;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/camera/widget/i$b;,
        Lcom/p1/mobile/putong/feed/newui/camera/widget/i$c;,
        Lcom/p1/mobile/putong/feed/newui/camera/widget/i$d;,
        Lcom/p1/mobile/putong/feed/newui/camera/widget/i$a;
    }
.end annotation


# instance fields
.field public final a:Lcom/google/android/material/tabs/TabLayout;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final b:Landroidx/viewpager2/widget/ViewPager2;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final c:Z

.field public final d:Lcom/p1/mobile/putong/feed/newui/camera/widget/i$b;

.field public e:Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "*>;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Z

.field public h:Lcom/p1/mobile/putong/feed/newui/camera/widget/i$c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Landroidx/recyclerview/widget/RecyclerView$i;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/material/tabs/TabLayout;Landroidx/viewpager2/widget/ViewPager2;ZZLcom/p1/mobile/putong/feed/newui/camera/widget/i$b;)V
    .locals 0
    .param p1    # Lcom/google/android/material/tabs/TabLayout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/viewpager2/widget/ViewPager2;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/p1/mobile/putong/feed/newui/camera/widget/i$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->c:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->g:Z

    .line 11
    .line 12
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->d:Lcom/p1/mobile/putong/feed/newui/camera/widget/i$b;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->e:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->f:Z

    .line 17
    .line 18
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/i$c;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 21
    .line 22
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/i$c;-><init>(Lcom/google/android/material/tabs/TabLayout;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->h:Lcom/p1/mobile/putong/feed/newui/camera/widget/i$c;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Landroidx/viewpager2/widget/ViewPager2;->g(Landroidx/viewpager2/widget/ViewPager2$i;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/i$d;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 35
    .line 36
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->g:Z

    .line 37
    .line 38
    invoke-direct {v1, v2, v3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/i$d;-><init>(Landroidx/viewpager2/widget/ViewPager2;Z)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->i:Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 44
    .line 45
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 46
    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->c:Z

    .line 49
    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/i$a;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/i$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/i;)V

    .line 55
    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->j:Landroidx/recyclerview/widget/RecyclerView$i;

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->e:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 60
    .line 61
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroidx/recyclerview/widget/RecyclerView$i;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->b()V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    const/4 v2, 0x0

    .line 76
    invoke-virtual {v1, p0, v2, v0}, Lcom/google/android/material/tabs/TabLayout;->setScrollPosition(IFZ)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    const-string p0, "TabLayoutMediator attached before ViewPager2 has an adapter"

    .line 81
    .line 82
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    const-string p0, "TabLayoutMediator is already attached"

    .line 87
    .line 88
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public b()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->removeAllTabs()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->e:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    :goto_0
    if-ge v2, v0, :cond_0

    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 19
    .line 20
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->d:Lcom/p1/mobile/putong/feed/newui/camera/widget/i$b;

    .line 25
    .line 26
    invoke-interface {v4, v3, v2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/i$b;->onConfigureTab(Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    .line 27
    .line 28
    .line 29
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 30
    .line 31
    invoke-virtual {v4, v3, v1}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;Z)V

    .line 32
    .line 33
    .line 34
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    if-lez v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/lit8 v0, v0, -0x1

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 48
    .line 49
    invoke-virtual {v1}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eq v0, v1, :cond_1

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->selectTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void
.end method
