.class public Ll/qjn0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/xjn0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/pyn0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/pyn0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;",
            "Ll/pyn0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/qjn0;->i:Ll/pyn0;

    .line 5
    .line 6
    new-instance p1, Ll/xjn0;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/xjn0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic J3(Ll/qjn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qjn0;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;)V

    return-void
.end method

.method public static bridge synthetic K3(Ll/qjn0;)Ll/pyn0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qjn0;->i:Ll/pyn0;

    return-object p0
.end method

.method public static synthetic L3(Ll/qjn0;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public M3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/xjn0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xjn0;->l()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public N3(Ljava/lang/String;)Ll/coj;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/rwn0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/rwn0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    new-instance p1, Ll/h64;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 32
    .line 33
    invoke-direct {p1, v0, v1, v2}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 37
    .line 38
    const-string v1, "gift-audience-none-voiceLiveMain"

    .line 39
    .line 40
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 41
    .line 42
    invoke-static {v0, v1, p0}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p1, p0}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_0
    const/4 p0, 0x0

    .line 52
    return-object p0
.end method

.method public final synthetic O3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/xjn0;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ll/xjn0;->x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    invoke-virtual {p0, p2}, Ll/qjn0;->N3(Ljava/lang/String;)Ll/coj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/hne0$a;

    .line 16
    .line 17
    invoke-direct {v2}, Ll/hne0$a;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v4, Ll/qjn0$a;

    .line 21
    .line 22
    invoke-direct {v4, p0}, Ll/qjn0$a;-><init>(Ll/qjn0;)V

    .line 23
    .line 24
    .line 25
    const-string v3, "giftWall"

    .line 26
    .line 27
    invoke-static {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v5, ""

    .line 32
    .line 33
    invoke-static {v3, v5}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    const-string v10, "voice_gift_wall"

    .line 38
    .line 39
    const/4 v5, 0x1

    .line 40
    const-string v6, "sendGiftWall"

    .line 41
    .line 42
    const-string v7, "sendGiftWall"

    .line 43
    .line 44
    move-object v3, p1

    .line 45
    move-object v9, p2

    .line 46
    invoke-virtual/range {v2 .. v10}, Ll/hne0$a;->v(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Ljava/lang/String;)Ll/hne0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const/4 p2, 0x0

    .line 51
    invoke-virtual {p1, p2}, Ll/hne0$a;->A(Z)Ll/hne0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1, v0}, Ll/hne0$a;->z(Ll/coj;)Ll/hne0$a;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ll/hne0$a;->t()Ll/hne0;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {v1, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_0

    .line 71
    .line 72
    invoke-static {}, Ll/zkn0;->a()V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_0
    invoke-static {}, Ll/zkn0;->b()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public R3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public S3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V
    .locals 1

    .line 1
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->isLight:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftWallBookId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/api/VoiceGiftWallApiProvider;->requestGiftWallDetail(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance p2, Ll/pjn0;

    .line 16
    .line 17
    invoke-direct {p2, p0, p3}, Ll/pjn0;-><init>(Ll/qjn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/r5k;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {p2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p0, Ll/xjn0;

    .line 36
    .line 37
    invoke-virtual {p0, p2, p3}, Ll/xjn0;->x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
