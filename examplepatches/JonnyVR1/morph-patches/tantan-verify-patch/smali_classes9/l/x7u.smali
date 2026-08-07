.class public final synthetic Ll/x7u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x7u;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;

    iput-object p2, p0, Ll/x7u;->b:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x7u;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;

    iget-object p0, p0, Ll/x7u;->b:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;->b(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Landroid/util/Pair;)V

    return-void
.end method
