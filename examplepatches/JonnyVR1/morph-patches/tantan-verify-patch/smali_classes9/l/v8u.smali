.class public final synthetic Ll/v8u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v8u;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v8u;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    return-void
.end method
