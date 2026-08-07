.class public Ll/bfp0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/virtual/settle/VoiceVirtualSettleSuccessView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final j:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;Lcom/p1/mobile/putong/live/livingroom/virtual/settle/VoiceVirtualSettleSuccessView;)V
    .locals 0
    .param p3    # Lcom/p1/mobile/putong/live/livingroom/virtual/settle/VoiceVirtualSettleSuccessView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/bfp0;->j:Ljava/util/Set;

    .line 10
    .line 11
    iput-object p3, p0, Ll/bfp0;->i:Lcom/p1/mobile/putong/live/livingroom/virtual/settle/VoiceVirtualSettleSuccessView;

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic J3(Ll/bfp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;)V

    return-void
.end method

.method public static synthetic K3(Ll/bfp0;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method

.method public static synthetic L3(Ll/bfp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->d4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;)V

    return-void
.end method

.method public static synthetic M3(Ll/bfp0;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method

.method public static synthetic N3(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic O3(Ll/bfp0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->n4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic P3(Ll/bfp0;Ll/u3m0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->l4(Ll/u3m0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic S3(Ll/bfp0;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method

.method public static synthetic T3(Ll/bfp0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bfp0;->m4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V3(Ll/bfp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleInviteMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bfp0;->g4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleInviteMessage;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W3(Ll/bfp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleInviteMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->x4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleInviteMessage;)V

    return-void
.end method

.method public static synthetic X3(Ll/bfp0;Ll/h4m0;)Ljava/util/HashSet;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->k4(Ll/h4m0;)Ljava/util/HashSet;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/bfp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->o4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;)V

    return-void
.end method

.method public static synthetic Z3(Ll/bfp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->f4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a4(Ll/bfp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomTitleUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bfp0;->h4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomTitleUpdate;)V

    return-void
.end method

.method private synthetic m4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bfp0;->v4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualRoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;->showVoiceRoomLevelDetail()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final c4(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->J0(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->likePopUp:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLikePopUp;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->toast:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->toast:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    return-void
.end method

.method public final d4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->K0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;->getMsgType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;->approve:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;

    .line 13
    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;->getUserId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/bfp0;->y4()V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Ll/bfp0;->j:Ljava/util/Set;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;->getUserId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;->getMsgType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;->quit:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;

    .line 50
    .line 51
    if-ne v0, v1, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Ll/bfp0;->j:Ljava/util/Set;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;->getUserId()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->refreshAllButton()Ll/v3f$c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->J0(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic f4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bfp0;->t4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleInviteMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleInviteMessage;->getApplyToken()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/bfp0;->w4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic h4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomTitleUpdate;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomTitleUpdate;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->E0(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic i4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bfp0;->j:Ljava/util/Set;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic j4(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/qep0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/qep0;-><init>(Ll/bfp0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic k4(Ll/h4m0;)Ljava/util/HashSet;
    .locals 0

    .line 1
    new-instance p1, Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bfp0;->j:Ljava/util/Set;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public final synthetic l4(Ll/u3m0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bfp0;->j:Ljava/util/Set;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/u3m0;->e()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

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

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/bfp0;->j:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bfp0;->v4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->getCoverUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->w0(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public p4()V
    .locals 3

    .line 1
    new-instance v0, Ll/px50$a;

    .line 2
    .line 3
    const/16 v1, 0x2328

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/px50$a;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Ll/efv;->J:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 11
    .line 12
    .line 13
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2, v1, v2}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 16
    .line 17
    .line 18
    const/16 v1, 0x50

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0}, Ll/px50$a;->q()Ll/px50;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public q4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCloseEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;->showFloatWindow()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/dan0;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const-string v2, "click_back_button"

    .line 15
    .line 16
    invoke-direct {v0, v1, v2}, Ll/dan0;-><init>(ZLjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public r4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualRoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;->showVirtualRoomInfoDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final s4()V
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
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getUserSettlesStatus(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/nep0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/nep0;-><init>(Ll/bfp0;)V

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

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    move-result-object v0

    invoke-virtual {v0}, Ll/aj1;->X0()Lrx/c;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/iep0;

    invoke-direct {v1, p0}, Ll/iep0;-><init>(Ll/bfp0;)V

    .line 3
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    move-result-object v0

    invoke-virtual {v0}, Ll/aj1;->T0()Lrx/c;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/tep0;

    invoke-direct {v1, p0}, Ll/tep0;-><init>(Ll/bfp0;)V

    .line 5
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 6
    invoke-virtual {p0}, Ll/bfp0;->u4()V

    .line 7
    invoke-virtual {p0}, Ll/bfp0;->s4()V

    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getVirtualVoiceRoomInfo(Ljava/lang/String;)Lrx/c;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/uep0;

    invoke-direct {v1, p0}, Ll/uep0;-><init>(Ll/bfp0;)V

    .line 9
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 11
    new-instance v0, Ll/vep0;

    invoke-direct {v0, p0}, Ll/vep0;-><init>(Ll/bfp0;)V

    const-class v1, Ll/h4m0;

    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    new-instance v0, Ll/wep0;

    invoke-direct {v0, p0}, Ll/wep0;-><init>(Ll/bfp0;)V

    const-class v1, Ll/u3m0;

    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    move-result-object v0

    invoke-virtual {v0}, Ll/aj1;->t0()Lrx/c;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 14
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Ll/xep0;

    invoke-direct {v2, v1}, Ll/xep0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;)V

    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    move-result-object v0

    invoke-virtual {v0}, Ll/aj1;->z0()Lrx/c;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/yep0;

    invoke-direct {v1, p0}, Ll/yep0;-><init>(Ll/bfp0;)V

    .line 16
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualRoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;->settleCurrentRoom()Ll/v3f$c;

    move-result-object v0

    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/c;

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/zep0;

    invoke-direct {v1, p0}, Ll/zep0;-><init>(Ll/bfp0;)V

    .line 18
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/rwn0;->L2()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    .line 21
    invoke-virtual {v0}, Ll/oo2;->B0()Lrx/c;

    move-result-object v0

    new-instance v1, Ll/afp0;

    invoke-direct {v1}, Ll/afp0;-><init>()V

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object v0

    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/jep0;

    invoke-direct {v1, p0}, Ll/jep0;-><init>(Ll/bfp0;)V

    .line 24
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    move-result-object v0

    invoke-virtual {v0}, Ll/aj1;->n1()Lrx/c;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/sep0;

    invoke-direct {v1, p0}, Ll/sep0;-><init>(Ll/bfp0;)V

    .line 26
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object p0

    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    return-void
.end method

.method public final t4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/pf60;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/oo2;->j0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "anchorId"

    .line 18
    .line 19
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/pf60;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ll/rwn0;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v3, "roomId"

    .line 35
    .line 36
    invoke-direct {v2, v3, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Ll/pf60;

    .line 40
    .line 41
    const-string v3, "click_type"

    .line 42
    .line 43
    const-string v4, "reject"

    .line 44
    .line 45
    invoke-direct {p0, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    filled-new-array {v1, v2, p0}, [Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string v1, "e_audio_member_invite_settle_pop"

    .line 53
    .line 54
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public u4()V
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
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getVirtualVoiceRoomSummary(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 22
    .line 23
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/mep0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/mep0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public v4()V
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
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->requestToSettleRoom(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/oep0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/oep0;-><init>(Ll/bfp0;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Ll/pep0;

    .line 31
    .line 32
    invoke-direct {p0}, Ll/pep0;-><init>()V

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

.method public final w4(Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/pf60;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/oo2;->j0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "anchorId"

    .line 18
    .line 19
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/pf60;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Ll/rwn0;

    .line 29
    .line 30
    invoke-virtual {v3}, Ll/vp20;->o()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const-string v4, "roomId"

    .line 35
    .line 36
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Ll/pf60;

    .line 40
    .line 41
    const-string v4, "click_type"

    .line 42
    .line 43
    const-string v5, "accept"

    .line 44
    .line 45
    invoke-direct {v3, v4, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    filled-new-array {v1, v2, v3}, [Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v2, "e_audio_member_invite_settle_pop"

    .line 53
    .line 54
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/rwn0;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->requestToSettleRoom(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    new-instance p1, Ll/rep0;

    .line 82
    .line 83
    invoke-direct {p1}, Ll/rep0;-><init>()V

    .line 84
    .line 85
    .line 86
    new-instance v0, Ll/z2e0;

    .line 87
    .line 88
    invoke-direct {v0}, Ll/z2e0;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final x4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleInviteMessage;)V
    .locals 3

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "\u9080\u8bf7\u5165\u9a7b"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleInviteMessage;->getFromUserName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, "\u9080\u8bf7\u4f60\u5165\u9a7b\u672c\u7fa4"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "\u62d2\u7edd"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/kep0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/kep0;-><init>(Ll/bfp0;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "\u5165\u9a7b"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/lep0;

    .line 61
    .line 62
    invoke-direct {v1, p0, p1}, Ll/lep0;-><init>(Ll/bfp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleInviteMessage;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const/4 p1, 0x0

    .line 70
    invoke-virtual {p0, p1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const/4 v0, 0x1

    .line 75
    invoke-virtual {p0, v0}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0, p1}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public y4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bfp0;->i:Lcom/p1/mobile/putong/live/livingroom/virtual/settle/VoiceVirtualSettleSuccessView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/settle/VoiceVirtualSettleSuccessView;->B0(Ll/bfp0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public z4(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method
