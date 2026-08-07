.class public final synthetic Ll/k4v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k4v;->a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

    iput-object p2, p0, Ll/k4v;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    iput-object p3, p0, Ll/k4v;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k4v;->a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

    iget-object v1, p0, Ll/k4v;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    iget-object p0, p0, Ll/k4v;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;->n(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
