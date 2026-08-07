.class public final synthetic Ll/rmu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y9m;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rmu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    iput-object p2, p0, Ll/rmu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    iput-object p3, p0, Ll/rmu;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    return-void
.end method


# virtual methods
.method public final onCompletion()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rmu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    iget-object v1, p0, Ll/rmu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    iget-object p0, p0, Ll/rmu;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->d(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    return-void
.end method
