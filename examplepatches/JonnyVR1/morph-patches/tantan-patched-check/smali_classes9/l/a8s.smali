.class public final synthetic Ll/a8s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a8s;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a8s;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
