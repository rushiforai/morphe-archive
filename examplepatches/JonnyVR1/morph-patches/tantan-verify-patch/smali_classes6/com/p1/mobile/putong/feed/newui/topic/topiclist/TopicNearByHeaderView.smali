.class public Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$b;
    }
.end annotation


# instance fields
.field public a:Lv/VRecyclerView;

.field public b:Landroid/view/View;

.field public c:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

.field public d:Ll/l9j0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->b(Lcom/p1/mobile/android/app/Act;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->c:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-ge p1, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x1

    .line 15
    if-eq p1, v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->c:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->W(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eq p1, v1, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->c:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->W(I)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final b(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-virtual {p0, v0, v3, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final c(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    new-instance v0, Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a:Lv/VRecyclerView;

    .line 7
    .line 8
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    const/4 v2, -0x2

    .line 12
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 13
    .line 14
    .line 15
    const/16 v1, 0x10

    .line 16
    .line 17
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 18
    .line 19
    const/high16 v1, 0x41400000    # 12.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 26
    .line 27
    const/high16 v2, 0x41900000    # 18.0f

    .line 28
    .line 29
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a:Lv/VRecyclerView;

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 41
    .line 42
    const/4 v2, 0x2

    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-direct {v0, v2, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;-><init>(II)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->c:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a:Lv/VRecyclerView;

    .line 50
    .line 51
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$b;

    .line 52
    .line 53
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-direct {v2, v1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$b;-><init>(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a:Lv/VRecyclerView;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->c:Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Ll/l9j0;

    .line 71
    .line 72
    invoke-direct {v0, p1}, Ll/l9j0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->d:Ll/l9j0;

    .line 76
    .line 77
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$a;

    .line 78
    .line 79
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p1}, Ll/kic0;->E(Ll/h80;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a:Lv/VRecyclerView;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->d:Ll/l9j0;

    .line 88
    .line 89
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a:Lv/VRecyclerView;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->b:Landroid/view/View;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->b:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->b:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public final e(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    move v0, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v0, v1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-lez v3, :cond_1

    .line 19
    .line 20
    move v3, v2

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    move v3, v1

    .line 23
    :goto_1
    if-eq v0, v3, :cond_4

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a:Lv/VRecyclerView;

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-lez v3, :cond_2

    .line 32
    .line 33
    move v3, v2

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    move v3, v1

    .line 36
    :goto_2
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->b:Landroid/view/View;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_4

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->b:Landroid/view/View;

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-lez p1, :cond_3

    .line 54
    .line 55
    move v1, v2

    .line 56
    :cond_3
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    :cond_4
    return-void
.end method

.method public f(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->d()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a(Ljava/util/List;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->e(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->d:Ll/l9j0;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/l9j0;->J(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public getmAdapter()Ll/l9j0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->d:Ll/l9j0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getmRecyclerView()Lv/VRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public setHeader(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Ll/zzk;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->d:Ll/l9j0;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/zzk;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/zzk;->H(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->getmRecyclerView()Lv/VRecyclerView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
