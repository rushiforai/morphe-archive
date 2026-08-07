.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;
.super Lv/VRecyclerView;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;

.field public d:Ll/jyj;


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

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;

    .line 29
    .line 30
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Landroidx/recyclerview/widget/v;

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/v;->setSupportsChangeAnimations(Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setRecycleChildrenOnDetach(Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public final G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yls;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H(Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->d:Ll/jyj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/jyj;

    .line 6
    .line 7
    invoke-direct {v0, p2, p1}, Ll/jyj;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->d:Ll/jyj;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->c:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {v0, p1}, Ll/jyj;->G(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->G(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
