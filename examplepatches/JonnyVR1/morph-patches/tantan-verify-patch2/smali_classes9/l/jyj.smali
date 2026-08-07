.class public Ll/jyj;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jyj;->d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jyj;->c:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jyj;->E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jyj;->c:Ljava/util/List;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/yec0;->C1:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jyj;->d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;

    .line 4
    .line 5
    invoke-virtual {p1, p2, p0, p4}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerItemView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jyj;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 8
    .line 9
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/jyj;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/jyj;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jyj;->F(I)Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
