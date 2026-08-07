.class public Ll/qdv;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;

.field public b:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qdv;->a:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/qdv;->a:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/qdv;->b:Landroid/view/View$OnClickListener;

    .line 9
    .line 10
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->h0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public I(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qdv;->b:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->nb:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qdv;->H(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
