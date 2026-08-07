.class public final synthetic Ll/z7s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z7s;->a:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z7s;->a:Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
