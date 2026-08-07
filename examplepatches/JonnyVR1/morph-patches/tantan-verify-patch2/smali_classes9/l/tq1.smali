.class public Ll/tq1;
.super Ll/fq1;
.source "SourceFile"


# instance fields
.field public final s:Ll/fri;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0, p2}, Ll/fq1;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 3
    .line 4
    .line 5
    new-instance p1, Ll/fri;

    .line 6
    .line 7
    iget-object p2, p0, Ll/xzs;->e:Ll/dum;

    .line 8
    .line 9
    invoke-direct {p1, p2, p0}, Ll/fri;-><init>(Ll/dum;Ll/kf2;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ll/fri;

    .line 17
    .line 18
    iput-object p1, p0, Ll/tq1;->s:Ll/fri;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public V3(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/kf2;->V3(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "firstRechargeBubble"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/tq1;->s:Ll/fri;

    .line 20
    .line 21
    iget-object p0, p0, Ll/fri;->j:Ll/x20;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-interface {p0}, Ll/x20;->call()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "firstRechargeButton"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/tq1;->s:Ll/fri;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/fri;->b4()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
