.class public final synthetic Ll/t9u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t9u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t9u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->J3(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
