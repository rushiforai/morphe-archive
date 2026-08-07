.class public Ll/ra80;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ll/dum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dum<",
            "*>;"
        }
    .end annotation
.end field

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ja80;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ll/ja80;",
            "Lcom/p1/mobile/putong/data/Pagination;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ll/z20;Ll/z20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "*>;",
            "Ll/z20<",
            "Ll/ja80;",
            "Lcom/p1/mobile/putong/data/Pagination;",
            ">;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ra80;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ra80;->g:Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Ll/ra80;->f:Ll/dum;

    .line 19
    .line 20
    iput-object p2, p0, Ll/ra80;->h:Ll/z20;

    .line 21
    .line 22
    iput-object p3, p0, Ll/ra80;->i:Ll/z20;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic q(Ll/ra80;Ll/ja80;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ra80;->s(Ll/ja80;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic r(Ll/ra80;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)Ll/ja80;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ra80;->t(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)Ll/ja80;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ra80;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ra80;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->name:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->H3:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/mdc0;->X4:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lv/VRecyclerView;

    .line 23
    .line 24
    sget v3, Ll/mdc0;->p1:I

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 31
    .line 32
    new-instance v4, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 33
    .line 34
    iget-object v5, p0, Ll/ra80;->f:Ll/dum;

    .line 35
    .line 36
    iget-object v5, v5, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    const/4 v6, 0x1

    .line 39
    invoke-direct {v4, v5, v6, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v4}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/ra80;->g:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ll/ja80;

    .line 52
    .line 53
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->da:I

    .line 54
    .line 55
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;->d(I)Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 56
    .line 57
    .line 58
    sget p2, Ll/n9c0;->j1:I

    .line 59
    .line 60
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;->c(I)Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 65
    .line 66
    .line 67
    sget p2, Ll/obc0;->k4:I

    .line 68
    .line 69
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;->b(I)Lcom/p1/mobile/putong/live/base/view/LiveEmptyView;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v1, v3}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Y(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 79
    .line 80
    .line 81
    return-object v0
.end method

.method public final synthetic s(Ll/ja80;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v0, v0, -0x3

    .line 10
    .line 11
    if-lt p2, v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ra80;->h:Ll/z20;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/ja80;->i0()Lcom/p1/mobile/putong/data/Pagination;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic t(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)Ll/ja80;
    .locals 3

    .line 1
    new-instance v0, Ll/ja80;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ra80;->f:Ll/dum;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ra80;->i:Ll/z20;

    .line 6
    .line 7
    invoke-direct {v0, v1, p1, v2}, Ll/ja80;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;Ll/z20;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/qa80;

    .line 11
    .line 12
    invoke-direct {p1, p0, v0}, Ll/qa80;-><init>(Ll/ra80;Ll/ja80;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public u(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ra80;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ra80;->e:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ra80;->g:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ra80;->g:Ljava/util/List;

    .line 17
    .line 18
    new-instance v1, Ll/pa80;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/pa80;-><init>(Ll/ra80;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 31
    .line 32
    .line 33
    return-void
.end method
