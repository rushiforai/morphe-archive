.class public Ll/iuj;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

.field public b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iuj;->a:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 5
    .line 6
    iput-object p2, p0, Ll/iuj;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/iuj;->a:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 5
    .line 6
    iget-object p0, p0, Ll/iuj;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->h0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->K8:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iuj;->H(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
