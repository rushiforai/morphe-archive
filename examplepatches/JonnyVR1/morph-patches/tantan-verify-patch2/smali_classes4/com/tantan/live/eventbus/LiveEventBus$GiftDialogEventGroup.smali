.class public Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/live/eventbus/LiveEventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GiftDialogEventGroup"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantan/live/eventbus/LiveEventBus;


# direct methods
.method public constructor <init>(Lcom/tantan/live/eventbus/LiveEventBus;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public addExtraInfo()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_7"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public closeH5Skin()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_17"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public dismissGiftDialog()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Integer;",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_5"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public giftDialogHeightChange()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_14"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public giftDialogOnShow()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_15"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public giftDialogPostShowing()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_16"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public giftDialogShowWithPacketPanel()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_23"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public giftDialogStatus()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_9"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public giftLongPressCancel()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_13"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public hideGiftOperationLayer()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_12"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public intlNewComboClick()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/ib0;",
            "Lrx/c<",
            "Ll/ib0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_27"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public onGiftDialogPanelSwitchChange()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/cwj;",
            "Lrx/c<",
            "Ll/cwj;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_22"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public onSengGiftFromMultipleGift()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/jne0;",
            "Lrx/c<",
            "Ll/jne0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_11"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public onVoiceDeputyChange()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/scn0;",
            "Lrx/c<",
            "Ll/scn0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_21"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public onVoicePositionChange()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_20"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public openGiftDialogEvent()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/lx50;",
            "Lrx/c<",
            "Ll/lx50;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_0"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public openGoWallet()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/ox50;",
            "Lrx/c<",
            "Ll/ox50;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_6"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public openSendGiftRecordsPage()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_18"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public performCpGiftItemClick()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/String;",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_26"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public refreshBottomIndicator()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/unj;",
            "Lrx/c<",
            "Ll/unj;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_19"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public reloadGift()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Integer;",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_2"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public reloadGiftByPositionGiftId()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/String;",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_4"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public reloadGiftWithAction()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/pf60;",
            "Lrx/c<",
            "Ll/pf60;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_3"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public showCpGiftDetailDialog()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/String;",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_25"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public showSendFirstGiftDlg()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/r7f0;",
            "Lrx/c<",
            "Ll/r7f0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_8"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public switchGiftDialogSourceEvent()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/lx50;",
            "Lrx/c<",
            "Ll/lx50;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_1"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public switchPacketPanel()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Integer;",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_10"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public updateItemModelAfterSendGift()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/f1k0;",
            "Lrx/c<",
            "Ll/f1k0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "39_24"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
