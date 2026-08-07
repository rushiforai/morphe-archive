.class public Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$e;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->G()V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$e;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
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
    if-nez p2, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$e;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->l(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Landroidx/recyclerview/widget/w;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$e;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 13
    .line 14
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/w;->h(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$p;->a()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$e;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 35
    .line 36
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    check-cast p2, Lcom/p1/mobile/putong/feed/data/CameraCategory;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$e;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 47
    .line 48
    invoke-static {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->r(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;Lcom/p1/mobile/putong/feed/data/CameraCategory;I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$e;->a:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->i(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    add-int/2addr p1, p2

    .line 11
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->n(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
