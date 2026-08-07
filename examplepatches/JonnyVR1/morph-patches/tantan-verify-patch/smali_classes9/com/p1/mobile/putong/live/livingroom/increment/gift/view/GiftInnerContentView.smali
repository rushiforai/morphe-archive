.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;
.super Lv/VRecyclerView;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;

.field public d:Ll/ttj;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x4

    .line 20
    invoke-direct {v0, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setRecycleChildrenOnDetach(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ctj;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l0k;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Ll/dtj;Ll/bjs;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dtj;",
            "Ll/bjs<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;->d:Ll/ttj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ttj;

    .line 6
    .line 7
    iget-object p1, p1, Ll/dtj;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-direct {v0, p2, p1}, Ll/ttj;-><init>(Ll/bjs;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;->d:Ll/ttj;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p1, Ll/dtj;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/ttj;->G(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public getRecyclerView()Lv/VRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;->G(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftInnerContentView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
