.class public Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;
.super Landroidx/viewpager2/widget/ViewPager2$i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/viewpager2/widget/ViewPager2$i;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;ILl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->d(ILl/pf60;)V

    return-void
.end method


# virtual methods
.method public final synthetic d(ILl/pf60;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->I(I)Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 24
    .line 25
    const/4 p2, 0x0

    .line 26
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 32
    .line 33
    invoke-static {p0, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 46
    .line 47
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Ll/ywg;

    .line 55
    .line 56
    iget-object p2, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast p2, Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p2, Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz p2, :cond_1

    .line 71
    .line 72
    if-le v0, v1, :cond_1

    .line 73
    .line 74
    iget-object p0, p0, Ll/ywg;->f:Ll/y20;

    .line 75
    .line 76
    new-instance v0, Ll/bkj0;

    .line 77
    .line 78
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 83
    .line 84
    invoke-direct {v0, p2, v2, v3}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p1, v1}, Ll/ezq;->c(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 91
    .line 92
    .line 93
    :cond_1
    return-void
.end method

.method public final synthetic e(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 20
    .line 21
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 34
    .line 35
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ll/ywg;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ll/ywg;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/ywg;->K(I)Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    if-le v2, v1, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Ll/ywg;->f:Ll/y20;

    .line 63
    .line 64
    new-instance v2, Ll/bkj0;

    .line 65
    .line 66
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 71
    .line 72
    invoke-direct {v2, v0, v3, v4}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {p0, v2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    invoke-static {p1, v1}, Ll/ezq;->c(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->I(I)Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance p1, Ll/pwg;

    .line 25
    .line 26
    invoke-direct {p1, p0, v0}, Ll/pwg;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p1}, Ll/fq50;->a(Landroid/view/View;Ljava/lang/Runnable;)Ll/fq50;

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->j:Lrx/subjects/a;

    .line 40
    .line 41
    new-instance v2, Ll/nwg;

    .line 42
    .line 43
    invoke-direct {v2, p0, p1}, Ll/nwg;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;I)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/owg;

    .line 47
    .line 48
    invoke-direct {p0}, Ll/owg;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->o(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;Ll/kcg0;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
