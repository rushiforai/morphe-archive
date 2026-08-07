.class public final synthetic Ll/wvc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerItemView;

.field public final synthetic b:Ll/xvc0;

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerItemView;Ll/xvc0;ILcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wvc0;->a:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerItemView;

    iput-object p2, p0, Ll/wvc0;->b:Ll/xvc0;

    iput p3, p0, Ll/wvc0;->c:I

    iput-object p4, p0, Ll/wvc0;->d:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wvc0;->a:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerItemView;

    iget-object v1, p0, Ll/wvc0;->b:Ll/xvc0;

    iget v2, p0, Ll/wvc0;->c:I

    iget-object p0, p0, Ll/wvc0;->d:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    invoke-static {v0, v1, v2, p0, p1}, Ll/xvc0;->E(Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerItemView;Ll/xvc0;ILcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;Landroid/view/View;)V

    return-void
.end method
