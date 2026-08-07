.class public Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Landroidx/recyclerview/widget/RecyclerView;

.field public d:Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;

.field public e:Ll/f030;

.field public f:Ll/b030;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uz20;->a(Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Ll/b030;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->f:Ll/b030;

    .line 2
    .line 3
    new-instance v0, Ll/f030;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/f030;-><init>(Ll/b030;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->e:Ll/f030;

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {p1, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 35
    .line 36
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->setRecycleChildrenOnDetach(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->e:Ll/f030;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final S(Lcom/p1/mobile/putong/data/CoreGiftPanelName;)Z
    .locals 0

    .line 1
    const-string p0, "note"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eq p1, p0, :cond_1

    .line 8
    .line 9
    const-string p0, "greet"

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-ne p1, p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public T(Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;I)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;->giftInfos:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->e:Ll/f030;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/f030;->M(Ljava/util/List;I)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->d:Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->b(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->f:Ll/b030;

    .line 16
    .line 17
    invoke-virtual {p2}, Ll/b030;->v()Ll/pz20;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p2}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->S(Lcom/p1/mobile/putong/data/CoreGiftPanelName;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    new-instance p2, Ll/tz20;

    .line 32
    .line 33
    invoke-direct {p2}, Ll/tz20;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, p2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 p2, 0x1

    .line 41
    if-le p1, p2, :cond_0

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public getAdapter()Ll/f030;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->e:Ll/f030;

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelPagerView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
