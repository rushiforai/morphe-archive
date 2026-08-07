.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;
.super Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$b;
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public g:Ll/lbf0;

.field public h:Landroidx/recyclerview/widget/LinearLayoutManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 5
    .line 6
    const/high16 v0, 0x431b0000    # 155.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    invoke-direct {p1, v1, v0}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 14
    .line 15
    .line 16
    sget v0, Ll/qa00;->i:I

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p1, v0, v1, v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-direct {p1, v0, v1, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->h:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 37
    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x2

    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->setOverScrollMode(I)V

    .line 45
    .line 46
    .line 47
    sget v0, Ll/qa00;->o:I

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/view/View;->setFadingEdgeLength(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/view/View;->setHorizontalFadingEdgeEnabled(Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveFadeRecyclerView;->H()V

    .line 56
    .line 57
    .line 58
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$b;

    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$b;-><init>(Ll/rbf0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Ll/lbf0;

    .line 68
    .line 69
    invoke-direct {p1}, Ll/lbf0;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->g:Ll/lbf0;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;)Landroidx/recyclerview/widget/LinearLayoutManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->h:Landroidx/recyclerview/widget/LinearLayoutManager;

    return-object p0
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;Ljava/util/List;Z)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->L(Ljava/util/List;Z)I

    move-result p0

    return p0
.end method


# virtual methods
.method public K(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->f:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->g:Ll/lbf0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/lbf0;->F(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final L(Ljava/util/List;Z)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;",
            ">;Z)I"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, -0x1

    .line 6
    if-nez p0, :cond_3

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    move p2, p0

    .line 13
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ge p2, v1, :cond_3

    .line 18
    .line 19
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    .line 24
    .line 25
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->finished:Z

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    if-nez p2, :cond_1

    .line 30
    .line 31
    return p0

    .line 32
    :cond_1
    add-int/lit8 v1, p2, -0x1

    .line 33
    .line 34
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    .line 39
    .line 40
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->finished:Z

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    return p2

    .line 45
    :cond_2
    add-int/lit8 p2, p2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    :goto_1
    return v0
.end method

.method public M(Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->g:Ll/lbf0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/lbf0;->H(Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
