.class public final synthetic Ll/xym;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;

.field public final synthetic b:Landroid/graphics/Bitmap;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xym;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;

    iput-object p2, p0, Ll/xym;->b:Landroid/graphics/Bitmap;

    iput-object p3, p0, Ll/xym;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xym;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;

    iget-object v1, p0, Ll/xym;->b:Landroid/graphics/Bitmap;

    iget-object p0, p0, Ll/xym;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;->l(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    return-void
.end method
