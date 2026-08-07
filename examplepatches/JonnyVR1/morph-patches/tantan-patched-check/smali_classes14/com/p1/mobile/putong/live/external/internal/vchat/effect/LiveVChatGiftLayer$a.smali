.class public Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$a;
.super Ll/x8e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->q(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$a;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/x8e;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$a;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;)Ll/mvk0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p1, v0, p0}, Ll/e4d0;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ll/e4d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/rre;->f(Ll/e4d0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
