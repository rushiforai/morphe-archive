.class public Ll/pyn0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/vyn0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/qjn0;

.field public j:Ljava/lang/String;

.field public k:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vyn0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/vyn0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/qjn0;

    .line 13
    .line 14
    invoke-direct {v0, p1, p0}, Ll/qjn0;-><init>(Ll/dum;Ll/pyn0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/qjn0;

    .line 22
    .line 23
    iput-object p1, p0, Ll/pyn0;->i:Ll/qjn0;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic J3(Ll/pyn0;ILcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pyn0;->S3(ILcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;)V

    return-void
.end method

.method public static synthetic K3(Ll/pyn0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceRollDice$VoiceGiftWallLightNoticeMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pyn0;->R3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceRollDice$VoiceGiftWallLightNoticeMessage;)V

    return-void
.end method

.method public static synthetic L3(Ll/pyn0;Ll/zjn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pyn0;->P3(Ll/zjn0;)V

    return-void
.end method

.method private M3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pyn0;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/pyn0;->j:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/vyn0;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/vyn0;->E(Lcom/p1/mobile/putong/data/User;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public N3(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/vyn0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/vyn0;->n(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pyn0;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/pyn0;->k:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Ll/pyn0;->i:Ll/qjn0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/pyn0;->j:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;->getVoiceGiftWallBrief()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v1, p0, p1, v0}, Ll/qjn0;->S3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic P3(Ll/zjn0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/zjn0;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/pyn0;->j:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Ll/pyn0;->i:Ll/qjn0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/qjn0;->M3()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/vyn0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/vyn0;->u()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/vyn0;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/zjn0;->a()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {v0, p1}, Ll/vyn0;->L(I)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Ll/pyn0;->M3()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceRollDice$VoiceGiftWallLightNoticeMessage;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/pyn0;->N3(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic S3(ILcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/pyn0;->k:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/vyn0;

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Ll/vyn0;->I(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftWallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGiftWallEvent;->showGiftWall()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/myn0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/myn0;-><init>(Ll/pyn0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/aj1;->N0()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/nyn0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/nyn0;-><init>(Ll/pyn0;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public T3()V
    .locals 6

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->a6()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v1, Ll/px50$a;

    .line 17
    .line 18
    const/16 v2, 0x2328

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ll/px50$a;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 24
    .line 25
    .line 26
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 27
    .line 28
    const-wide v4, 0x3fe6666666666666L    # 0.7

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2, v3, v4, v5}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 34
    .line 35
    .line 36
    const/16 v0, 0x50

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v1}, Ll/px50$a;->q()Ll/px50;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public U3(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pyn0;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/pyn0;->j:Ljava/lang/String;

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 v1, 0x0

    .line 17
    :goto_0
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/api/VoiceGiftWallApiProvider;->requestGiftWallList(Ljava/lang/String;Z)Lrx/c;

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
    new-instance v1, Ll/oyn0;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/oyn0;-><init>(Ll/pyn0;I)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Ll/r5k;

    .line 31
    .line 32
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public V3()V
    .locals 1

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
    iput-object v0, p0, Ll/pyn0;->j:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/vyn0;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Ll/vyn0;->L(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
