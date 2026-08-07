.class public final synthetic Ll/smu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z9m;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/smu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    iput-object p2, p0, Ll/smu;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    return-void
.end method


# virtual methods
.method public final onError(ILjava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/smu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    iget-object p0, p0, Ll/smu;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ILjava/lang/String;)Z

    move-result p0

    return p0
.end method
