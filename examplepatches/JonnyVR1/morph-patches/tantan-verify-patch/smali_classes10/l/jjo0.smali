.class public Ll/jjo0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;",
        ">;"
    }
.end annotation


# static fields
.field public static i:Ljava/lang/String; = "voiceRedPacket"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/rwn0;

    .line 16
    .line 17
    iget-object p0, p0, Ll/rwn0;->Z:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->setCurrentPackId(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Ll/jjo0;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getOperationType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Ll/jjo0;->i:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic L3(Ll/jjo0;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jjo0;->S3(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic M3(Ll/jjo0;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jjo0;->R3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    return-void
.end method

.method public static synthetic N3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic O3(Ll/jjo0;Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jjo0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V

    return-void
.end method

.method private synthetic S3(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jjo0;->T3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final P3(Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 13
    .line 14
    new-instance v0, Ll/ijo0;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/ijo0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 24
    .line 25
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->E()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->S(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->E()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jjo0;->T3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T3()V
    .locals 2

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
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getVoiceRedPacketData(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/hjo0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/hjo0;-><init>(Ll/jjo0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->F()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v2, Ll/djo0;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/djo0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v2, Ll/ejo0;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/ejo0;-><init>(Ll/jjo0;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v1, 0x1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/fjo0;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/fjo0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/gjo0;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/gjo0;-><init>(Ll/jjo0;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/jjo0;->T3()V

    .line 79
    .line 80
    .line 81
    return-void
.end method
