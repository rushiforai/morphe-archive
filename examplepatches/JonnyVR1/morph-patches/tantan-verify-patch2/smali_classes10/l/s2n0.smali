.class public Ll/s2n0;
.super Ll/ixm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ixm0<",
        "Ll/jlm0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Ll/sam;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ixm0;-><init>(Ll/dum;Ll/sam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A4(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/v1n0;->c()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/snm0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {v0, v1, p1}, Ll/snm0;-><init>(II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceApplyManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceApplyManagerEvent;->show()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ixm0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->refreshAllButton()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public z4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/jlm0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p2, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p2, Ll/h64;

    .line 16
    .line 17
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p2, p2, Ll/h64;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, p1, p2}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
