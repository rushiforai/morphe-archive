.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VRecyclerView;

.field public d:Ll/ohg;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ohg;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/ohg;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->d:Ll/ohg;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/ohg;

    invoke-direct {p1}, Ll/ohg;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->d:Ll/ohg;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/ohg;

    invoke-direct {p1}, Ll/ohg;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->d:Ll/ohg;

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jig;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Ll/acg;Ll/yhg;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->d:Ll/ohg;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Ll/ohg;->j0(Ll/y8s;Ll/yhg;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->d:Ll/ohg;

    .line 11
    .line 12
    invoke-virtual {p3, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;->X(Ll/ohg;Ll/acg;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->c:Lv/VRecyclerView;

    .line 8
    .line 9
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x1

    .line 17
    invoke-direct {v1, v2, v4, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->c:Lv/VRecyclerView;

    .line 24
    .line 25
    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->c:Lv/VRecyclerView;

    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView$a;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->c:Lv/VRecyclerView;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->d:Ll/ohg;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
