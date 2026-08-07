.class public Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 9
    .line 10
    if-nez p2, :cond_1

    .line 11
    .line 12
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->a:Z

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 21
    .line 22
    invoke-static {p2}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->u(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Ll/zzk;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2}, Ll/zzk;->getItemCount()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    add-int/lit8 p2, p2, -0x1

    .line 31
    .line 32
    if-lt p1, p2, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->v(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->v(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-lez p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->z(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 71
    .line 72
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->w(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Ll/otl;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-interface {p1}, Ll/otl;->isLoading()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_0

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 84
    .line 85
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->s(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 90
    .line 91
    invoke-static {p2}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->z(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->c(Z)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 99
    .line 100
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->w(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Ll/otl;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->b:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 105
    .line 106
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->v(Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getProcessedNext()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-interface {p1, p0}, Ll/otl;->f(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_1
    :goto_0
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    if-lez p3, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView$a;->a:Z

    .line 10
    .line 11
    return-void
.end method
