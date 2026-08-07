.class public Ll/kyj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kyj;->a:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kyj;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;->H(Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kyj;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;
    .locals 3

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
    sget v1, Ll/yec0;->T5:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;

    .line 17
    .line 18
    iput-object p1, p0, Ll/kyj;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveGiftStickerContentView;

    .line 19
    .line 20
    return-object p1
.end method
