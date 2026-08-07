.class public Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;
.super Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public loadResError(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->loadResError(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 13
    .line 14
    invoke-static {v0, p1}, Ll/muj;->J(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;)Ll/mvk0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {p1, v1, p0}, Ll/rre;->t(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 13
    .line 14
    invoke-static {p0}, Ll/muj;->K(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 13
    .line 14
    invoke-static {v0}, Ll/muj;->L(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;)Ll/mvk0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {v0, v1, p0}, Ll/rre;->t(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
