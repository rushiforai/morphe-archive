.class public Ll/yin0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/jjn0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jjn0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/jjn0;-><init>(Ll/yin0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S3(Ll/yin0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yin0;->V3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic T3(Ll/yin0;Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yin0;->U3(Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;)V

    return-void
.end method

.method private synthetic V3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yin0;->Z3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGiftRecordEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftRecordEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftRecordEvent;->show()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/win0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/win0;-><init>(Ll/yin0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final U3(Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jjn0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jjn0;->W(Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public W3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public X3()V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getBossCall(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/xin0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/xin0;-><init>(Ll/yin0;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public Y3(Ljava/lang/String;ILl/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/16 v1, 0x14

    .line 12
    .line 13
    invoke-static {v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getGiftRecord(Ljava/lang/String;Ljava/lang/String;II)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p3}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public Z3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jjn0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jjn0;->Y()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/yin0;->X3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
