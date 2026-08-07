.class public final synthetic Ll/q4v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q4v;->a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

    iput-object p2, p0, Ll/q4v;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q4v;->a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;

    iget-object p0, p0, Ll/q4v;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;->d(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/LiveVoiceCallAuctionView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;Landroid/view/View;)V

    return-void
.end method
