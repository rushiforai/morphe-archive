.class public Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;
.super Lv/VRecyclerView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fxj;->a(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H(Ljava/util/List;Ll/bwj;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;",
            "Ll/bwj;",
            "I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;->c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;

    .line 2
    .line 3
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v1, v2, p3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 13
    .line 14
    .line 15
    new-instance p3, Ll/lxj;

    .line 16
    .line 17
    invoke-direct {p3, p2}, Ll/lxj;-><init>(Ll/bwj;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;->c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;

    .line 21
    .line 22
    new-instance v1, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;

    .line 23
    .line 24
    sget v2, Ll/qa00;->f:I

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-direct {v1, v2, v2, v2, v3}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView$a;-><init>(IIII)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;->c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;

    .line 34
    .line 35
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Ll/bwj;->k()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p3, p1, p0}, Ll/lxj;->N(Ljava/util/List;I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;->G(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;->c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;->c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftRecyclerItemView;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
