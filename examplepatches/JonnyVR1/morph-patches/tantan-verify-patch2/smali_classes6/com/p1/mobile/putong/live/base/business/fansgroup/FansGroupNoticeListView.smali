.class public Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$b;


# instance fields
.field public a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public b:Lv/VRecyclerView;

.field public c:Lv/VLinear;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Z

.field public g:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/zzk;

.field public i:Ll/xfg;

.field public j:Ll/otl;

.field public k:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

.field public final l:Landroidx/recyclerview/widget/RecyclerView$t;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;-><init>(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->l:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;-><init>(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->l:Landroidx/recyclerview/widget/RecyclerView$t;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;-><init>(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->l:Landroidx/recyclerview/widget/RecyclerView$t;

    return-void
.end method

.method private C()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->g:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->g:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getProcessedNext()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private synthetic F()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->j:Ll/otl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/otl;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private L()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->b:Lv/VRecyclerView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->c:Lv/VLinear;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->d:Lv/VImage;

    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->f:Z

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    sget v1, Ll/mbc0;->a0:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget v1, Ll/mbc0;->j0:I

    .line 24
    .line 25
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->e:Lv/VText;

    .line 29
    .line 30
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->f:Z

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    const-string p0, "#4dffffff"

    .line 35
    .line 36
    :goto_1
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    goto :goto_2

    .line 41
    :cond_1
    const-string p0, "#4d323232"

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :goto_2
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->F()V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->k:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    return-object p0
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Ll/zzk;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->h:Ll/zzk;

    return-object p0
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->g:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    return-object p0
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Ll/otl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->j:Ll/otl;

    return-object p0
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->C()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cgg;->a(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public E(ZLl/otl;)V
    .locals 4

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->j:Ll/otl;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->f:Z

    .line 4
    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 6
    .line 7
    sget v0, Ll/l9c0;->m:I

    .line 8
    .line 9
    sget v1, Ll/l9c0;->j:I

    .line 10
    .line 11
    sget v2, Ll/l9c0;->k:I

    .line 12
    .line 13
    sget v3, Ll/l9c0;->l:I

    .line 14
    .line 15
    filled-new-array {v0, v1, v2, v3}, [I

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p2, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 20
    .line 21
    .line 22
    new-instance p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x1

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-direct {p2, v0, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->b:Lv/VRecyclerView;

    .line 34
    .line 35
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->b:Lv/VRecyclerView;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->l:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 41
    .line 42
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 43
    .line 44
    .line 45
    new-instance p2, Ll/xfg;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->j:Ll/otl;

    .line 48
    .line 49
    invoke-direct {p2, p1, v0}, Ll/xfg;-><init>(ZLl/otl;)V

    .line 50
    .line 51
    .line 52
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->i:Ll/xfg;

    .line 53
    .line 54
    new-instance v0, Ll/zzk;

    .line 55
    .line 56
    invoke-direct {v0, p2}, Ll/zzk;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->h:Ll/zzk;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    sget v0, Ll/vec0;->H:I

    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    invoke-static {p2, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    check-cast p2, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 73
    .line 74
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->k:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 75
    .line 76
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->setIsHalf(Z)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->h:Ll/zzk;

    .line 80
    .line 81
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->k:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Ll/zzk;->F(Landroid/view/View;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->b:Lv/VRecyclerView;

    .line 87
    .line 88
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->h:Ll/zzk;

    .line 89
    .line 90
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 94
    .line 95
    new-instance p2, Ll/bgg;

    .line 96
    .line 97
    invoke-direct {p2, p0}, Ll/bgg;-><init>(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, p2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public G()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->k:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->g:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->i:Ll/xfg;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Ll/xfg;->z(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->k:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->C()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->f(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->g:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->i:Ll/xfg;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Ll/xfg;->D(Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->k:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->C()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->f(Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->L()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public N(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->i:Ll/xfg;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xfg;->y()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->i:Ll/xfg;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/xfg;->y()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;

    .line 24
    .line 25
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->setStatus(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->i:Ll/xfg;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->j:Ll/otl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/otl;->isLoading()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->k:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->C()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->c(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->j:Ll/otl;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->g:Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getProcessedNext()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {v0, p0}, Ll/otl;->f(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
