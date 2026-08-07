.class public Ll/w6m0;
.super Ll/atm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/atm0<",
        "Ll/k5m0<",
        "TD;>;TD;>;"
    }
.end annotation


# instance fields
.field public final k:Ll/xak0;

.field public l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

.field public m:Ljava/lang/String;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

.field public o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/atm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/xak0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/xak0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/w6m0;->k:Ll/xak0;

    .line 10
    .line 11
    new-instance p1, Ll/k5m0;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/k5m0;-><init>(Ll/w6m0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic A4(Ll/w6m0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w6m0;->V4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B4(Ll/w6m0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w6m0;->b5(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic C4(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic D4(Ll/w6m0;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w6m0;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    return-object p0
.end method

.method public static bridge synthetic E4(Ll/w6m0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w6m0;->l5(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    return-void
.end method

.method private synthetic a5(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w6m0;->J4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b5(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/w6m0;->m5(Ll/vak0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic l4(Ll/w6m0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w6m0;->c5(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V

    return-void
.end method

.method public static synthetic m4(Ll/w6m0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w6m0;->R4(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    return-void
.end method

.method public static synthetic n4(Ll/w6m0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w6m0;->Q4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic o4(Ljava/lang/Throwable;)Ll/vak0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic p4(Ll/w6m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w6m0;->U4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q4(Ll/w6m0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/vak0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w6m0;->X4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/vak0;)V

    return-void
.end method

.method public static synthetic r4(Ll/w6m0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w6m0;->a5(Ll/vxj0;)V

    return-void
.end method

.method private r5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/w6m0;->L4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/w6m0;->L4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->isFromJs()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/t8s;->m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic s4(Ll/w6m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w6m0;->T4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t4(Ll/w6m0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w6m0;->K4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic u4(Ll/w6m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w6m0;->S4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v4(Ll/w6m0;Ll/vak0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w6m0;->Y4(Ll/vak0;)V

    return-void
.end method

.method public static synthetic w4(Ll/w6m0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w6m0;->W4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    return-void
.end method

.method public static synthetic x4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u64cd\u4f5c\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic y4(Ll/w6m0;ZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w6m0;->Z4(ZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic z4(Ll/w6m0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w6m0;->P4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public F4(Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "anchorId"

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/rwn0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "roomId"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/rwn0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "liveId"

    .line 44
    .line 45
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2}, Ll/vak0;->o()Ll/nsv;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 62
    .line 63
    const-string v3, "other_user_id"

    .line 64
    .line 65
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    const-string v3, "button_type"

    .line 70
    .line 71
    const-string v4, "agree"

    .line 72
    .line 73
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    filled-new-array {p1, v0, v1, v2, v3}, [Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string v0, "e_audio_add_apply_button"

    .line 82
    .line 83
    const-string v1, "p_audio_profile"

    .line 84
    .line 85
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0}, Ll/atm0;->f4()Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->postLike(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    new-instance v0, Ll/l6m0;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Ll/l6m0;-><init>(Ll/w6m0;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    new-instance v0, Ll/m6m0;

    .line 118
    .line 119
    invoke-direct {v0, p0}, Ll/m6m0;-><init>(Ll/w6m0;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public G4(Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;)V
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/rwn0;

    .line 11
    .line 12
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;->giftId:I

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ll/oo2;->w0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;->giftId:I

    .line 19
    .line 20
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v3, "giftId"

    .line 25
    .line 26
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    const-wide/16 v3, 0x0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 36
    .line 37
    .line 38
    move-result-wide v3

    .line 39
    :goto_0
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v3, "giftUnitPrice"

    .line 44
    .line 45
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string v3, "module"

    .line 50
    .line 51
    const-string v4, "audio_pay_guide_profile_add"

    .line 52
    .line 53
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const-string v5, "giftCombos"

    .line 58
    .line 59
    const-string v6, ""

    .line 60
    .line 61
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-virtual/range {p0 .. p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    invoke-virtual {v7}, Ll/vak0;->o()Ll/nsv;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    iget-object v7, v7, Ll/nsv;->a:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v7, Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    iget-object v7, v7, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 78
    .line 79
    const-string v8, "gift_receiver_id"

    .line 80
    .line 81
    invoke-static {v8, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    filled-new-array {v2, v1, v3, v5, v7}, [Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const-string v2, "e_gift"

    .line 90
    .line 91
    const-string v3, "p_audio_profile"

    .line 92
    .line 93
    invoke-static {v2, v3, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 94
    .line 95
    .line 96
    new-instance v7, Ll/hne0$a;

    .line 97
    .line 98
    invoke-direct {v7}, Ll/hne0$a;-><init>()V

    .line 99
    .line 100
    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .line 105
    .line 106
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;->giftId:I

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v8

    .line 118
    new-instance v9, Ll/w6m0$a;

    .line 119
    .line 120
    move-object/from16 v1, p0

    .line 121
    .line 122
    invoke-direct {v9, v1}, Ll/w6m0$a;-><init>(Ll/w6m0;)V

    .line 123
    .line 124
    .line 125
    iget v10, v0, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;->giftCount:I

    .line 126
    .line 127
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 132
    .line 133
    .line 134
    move-result-object v13

    .line 135
    invoke-virtual {v1}, Ll/w6m0;->h4()Ll/vak0;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-object v0, v0, Ll/vak0;->c:Ll/nsv;

    .line 140
    .line 141
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 144
    .line 145
    iget-object v14, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 146
    .line 147
    const-string v15, "source_voice_gift_guide"

    .line 148
    .line 149
    const-string v11, "audio_pay_guide_profile_add"

    .line 150
    .line 151
    const-string v12, "audio_pay_guide_profile_add"

    .line 152
    .line 153
    invoke-virtual/range {v7 .. v15}, Ll/hne0$a;->v(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Ljava/lang/String;)Ll/hne0$a;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0}, Ll/hne0$a;->t()Ll/hne0;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 166
    .line 167
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public H4(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;->onCancelManager()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public I4(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

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
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/rwn0;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Ll/rwn0;

    .line 46
    .line 47
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v0, v1, v2}, Ll/xak0;->j(ZLjava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ll/rwn0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->callInvite(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/j6m0;

    .line 75
    .line 76
    invoke-direct {v1, p0, p1}, Ll/j6m0;-><init>(Ll/w6m0;Lcom/p1/mobile/putong/data/User;)V

    .line 77
    .line 78
    .line 79
    new-instance p0, Ll/wnt;

    .line 80
    .line 81
    invoke-direct {p0}, Ll/wnt;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Ll/rwn0;

    .line 97
    .line 98
    invoke-virtual {v1}, Ll/oo2;->H0()Ll/c0m;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-interface {v1}, Ll/c0m;->d()Ll/h0m;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-interface {v1}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    instance-of v1, v1, Ll/zs2;

    .line 111
    .line 112
    if-eqz v1, :cond_4

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Ll/rwn0;

    .line 119
    .line 120
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v1}, Ll/y6s;->c(Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_3

    .line 131
    .line 132
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 133
    .line 134
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eqz v1, :cond_3

    .line 145
    .line 146
    new-instance v1, Ll/u35;

    .line 147
    .line 148
    const/16 v2, 0x1b64

    .line 149
    .line 150
    invoke-direct {v1, v2}, Ll/u35;-><init>(I)V

    .line 151
    .line 152
    .line 153
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 154
    .line 155
    iput-object v2, v1, Ll/u35;->d:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    check-cast v2, Ljava/lang/Boolean;

    .line 162
    .line 163
    iget-boolean v1, v1, Ll/u35;->c:Z

    .line 164
    .line 165
    if-eqz v1, :cond_2

    .line 166
    .line 167
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_1

    .line 172
    .line 173
    new-instance v1, Ll/th0$a;

    .line 174
    .line 175
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 176
    .line 177
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 178
    .line 179
    .line 180
    const-string v2, "\u786e\u8ba4\u8981\u79bb\u5f00\u4e3b\u6301\u4f4d\uff1f"

    .line 181
    .line 182
    invoke-virtual {v1, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 187
    .line 188
    invoke-virtual {v1, v2}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    new-instance v2, Ll/k6m0;

    .line 193
    .line 194
    invoke-direct {v2, p0, v0, p1}, Ll/k6m0;-><init>(Ll/w6m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/data/User;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->I1:I

    .line 202
    .line 203
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_1
    const-string p0, "\u6e38\u620f\u4e2d\uff0c\u4e0d\u80fd\u4e0b\u4e3b\u6301\u4f4d"

    .line 216
    .line 217
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    return-void

    .line 221
    :cond_2
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 222
    .line 223
    invoke-virtual {p0, v0, p1}, Ll/w6m0;->d5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :cond_3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {p0, v0, p1}, Ll/w6m0;->d5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    :cond_4
    return-void
.end method

.method public J4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w6m0;->k:Ll/xak0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xak0;->b()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    check-cast p0, Ll/k5m0;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final K4(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "voiceUserCard"

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Ll/k5m0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/w6m0;->L4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->isShowShadow()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p1, v0, v1, v1}, Ll/k5m0;->Q0(ZLl/vak0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ll/atm0;->j4(Ll/vak0;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Ll/w6m0;->r5()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public L4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w6m0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/w6m0;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 11
    .line 12
    return-object p0
.end method

.method public M4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceLive"

    .line 2
    .line 3
    return-object p0
.end method

.method public N4()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "voiceroom-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/w6m0;->L4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getSource()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public O4(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/vak0;->o()Ll/nsv;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v0, 0x5

    .line 34
    invoke-static {p1, v0}, Ll/bf10;->w(Ljava/lang/String;I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v0, "\u6210\u4e3a\u7ba1\u7406\u5458\u540e\uff0c\u5bf9\u65b9\u53ef\u5e2e\u4f60\u7ba1\u7406\u9ea6\u4f4d\u53ca\u5165\u9a7b\u6210\u5458\u3002\u786e\u8ba4\u9080\u8bf7 %s \u4e3a\u7ba1\u7406\u5458\u5417\uff1f"

    .line 39
    .line 40
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 49
    .line 50
    invoke-direct {v1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-ltz v0, :cond_0

    .line 58
    .line 59
    new-instance v2, Landroid/text/style/StyleSpan;

    .line 60
    .line 61
    const/4 v3, 0x1

    .line 62
    invoke-direct {v2, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    add-int/2addr p1, v0

    .line 70
    const/16 v3, 0x21

    .line 71
    .line 72
    invoke-virtual {v1, v2, v0, p1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 73
    .line 74
    .line 75
    :cond_0
    new-instance p1, Ll/th0$a;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    const-string v0, "\u9080\u4e3a\u7ba1\u7406\u5458"

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const-string v0, "\u786e\u8ba4"

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    new-instance v0, Ll/i6m0;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Ll/i6m0;-><init>(Ll/w6m0;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string p1, "\u53d6\u6d88"

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;->onInviteUserBecomeManager()Ll/v3f$d;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Ll/vak0;->o()Ll/nsv;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 144
    .line 145
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/w6m0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/z8p0;->c(Ljava/util/Collection;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/atm0;->j4(Ll/vak0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic P4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/atm0;->f4()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->q5(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic Q4(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w6m0;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/w6m0;->l5(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isRelationshipMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 13
    .line 14
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    const-string v1, "chatroom_male"

    .line 17
    .line 18
    invoke-virtual {v0, p0, p1, v1}, Ll/wrv;->q0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public R3()V
    .locals 3
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    new-instance v0, Ll/v5m0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v2, Ll/k5m0;

    .line 8
    .line 9
    iget-object v2, v2, Ll/k5m0;->v:Lv/VImage;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/v5m0;-><init>(Ll/dum;Lv/VImage;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/zdm0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ll/zdm0;-><init>(Ll/dum;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/mkp0;

    .line 28
    .line 29
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 30
    .line 31
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v2, Ll/k5m0;

    .line 34
    .line 35
    iget-object v2, v2, Ll/k5m0;->r:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleView;

    .line 36
    .line 37
    invoke-direct {v0, v1, v2}, Ll/mkp0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleView;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 41
    .line 42
    .line 43
    new-instance v0, Ll/b6m0;

    .line 44
    .line 45
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 46
    .line 47
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast v2, Ll/k5m0;

    .line 50
    .line 51
    iget-object v2, v2, Ll/k5m0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 52
    .line 53
    invoke-direct {v0, v1, v2}, Ll/b6m0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 57
    .line 58
    .line 59
    new-instance v0, Ll/ddm0;

    .line 60
    .line 61
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 62
    .line 63
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 64
    .line 65
    check-cast v2, Ll/k5m0;

    .line 66
    .line 67
    iget-object v2, v2, Ll/k5m0;->q:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;

    .line 68
    .line 69
    invoke-direct {v0, v1, v2}, Ll/ddm0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 73
    .line 74
    .line 75
    new-instance v0, Ll/g7m0;

    .line 76
    .line 77
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 78
    .line 79
    invoke-direct {v0, v1}, Ll/g7m0;-><init>(Ll/dum;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic R4(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ef:I

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->vg:I

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 36
    .line 37
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1, p2}, Ll/vak0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 62
    .line 63
    check-cast p0, Ll/k5m0;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic S4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/w6m0;->d5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic T4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;->onInviteUserBecomeManager()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/vak0;->o()Ll/nsv;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic U4(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/w6m0;->o5(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic V4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/uxj0;)Lrx/c;
    .locals 10

    .line 1
    new-instance v0, Ll/gbk0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gbk0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Ll/rwn0;

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/vp20;->k()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getFromIdentity()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getTo()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {p0}, Ll/w6m0;->M4()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {p0}, Ll/w6m0;->N4()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/rwn0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    const/4 v8, 0x1

    .line 47
    const-string v9, "voiceFollowships,relationships"

    .line 48
    .line 49
    invoke-virtual/range {v0 .. v9}, Ll/gbk0;->q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public final synthetic W4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 7

    .line 1
    iput-object p1, p0, Ll/w6m0;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/w6m0;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 22
    .line 23
    iget-object v1, p0, Ll/w6m0;->k:Ll/xak0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 46
    .line 47
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    const-string v2, "p_audio_profile"

    .line 54
    .line 55
    move-object v6, p1

    .line 56
    invoke-virtual/range {v1 .. v6}, Ll/xak0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic X4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/vak0;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;-><init>(Ll/vak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/w6m0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Y4(Ll/vak0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Ll/w6m0;->K4(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Ll/k5m0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/w6m0;->L4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->isShowShadow()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object p0, p0, Ll/w6m0;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1, p0}, Ll/k5m0;->Q0(ZLl/vak0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic Z4(ZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "\u559c\u6b22\u5df2\u53d1\u9001"

    .line 4
    .line 5
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string p1, "\u559c\u6b22\u5df2\u53d6\u6d88"

    .line 10
    .line 11
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0}, Ll/w6m0;->L4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/w6m0;->p5(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public c4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceLiveRoom"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic c5(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/k5m0;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/w6m0;->n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/w6m0;->p5(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public d5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V
    .locals 3

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
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

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
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/hrk0;->r()Ll/ado0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, p2}, Ll/ado0;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 34
    .line 35
    if-nez p2, :cond_1

    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    check-cast p2, Ll/rwn0;

    .line 42
    .line 43
    invoke-virtual {p2}, Ll/rwn0;->p()Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_2

    .line 48
    .line 49
    :cond_1
    const-string p2, "voice-manager"

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const-string p2, ""

    .line 53
    .line 54
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ll/rwn0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    const-string v0, "p_anchor_audio_room"

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    const-string v0, "p_user_audio_room"

    .line 70
    .line 71
    :goto_1
    const-string v1, "scene"

    .line 72
    .line 73
    const-string v2, "AudioProfileCard"

    .line 74
    .line 75
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    filled-new-array {v1}, [Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const-string v2, "e_audio_remove"

    .line 84
    .line 85
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p0, p1, p2}, Ll/ydn0;->g(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 92
    .line 93
    check-cast p0, Ll/k5m0;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public e5(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/w6m0;->J4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;->dismiss()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CALL_ANCHOR_CHECK_DIALOG:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/t8s;->m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/vv4;

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-direct {v1, v2, p1}, Ll/vv4;-><init>(ZLjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/w6m0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v1, p0}, Ll/vv4;->a(Ljava/lang/String;)Ll/vv4;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "3"

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/vv4;->b(Ljava/lang/String;)Ll/vv4;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public f5(Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/atm0;->d4()Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/atm0;->d4()Ll/nsv;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/rwn0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v3, "profilePage"

    .line 36
    .line 37
    const-string v4, "voice_live_profile_page"

    .line 38
    .line 39
    invoke-static {v3, v4, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VoiceVirtualApi;->getVirtualLikeFromJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    if-eqz p1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Ll/rwn0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const/4 p1, 0x0

    .line 61
    :goto_0
    const-string v2, "voicelive"

    .line 62
    .line 63
    invoke-static {v2, p1}, Ll/g7k0;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    const/4 v2, 0x0

    .line 68
    const/4 v3, 0x1

    .line 69
    invoke-static/range {v0 .. v5}, Ll/g7k0;->b(Landroid/content/Context;Ll/nsv;ZZLjava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    invoke-virtual {p0}, Ll/w6m0;->J4()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public g5(Lv/VText;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/w6m0;->h4()Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p3}, Ll/by5;->a(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const-string p3, "anchorId"

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/i6t;->j3()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    const-string v0, "like"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string v0, "cancel"

    .line 28
    .line 29
    :goto_0
    const-string v1, "click_type"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "liveId"

    .line 46
    .line 47
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v2, "receiver_user_id"

    .line 52
    .line 53
    invoke-static {v2, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    filled-new-array {p3, v0, v1, p2}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    const-string p3, "e_audio_like"

    .line 62
    .line 63
    const-string v0, "p_audio_profile"

    .line 64
    .line 65
    invoke-static {p3, v0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    const/4 p1, 0x1

    .line 71
    invoke-virtual {p0, p1}, Ll/w6m0;->o5(Z)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    new-instance p1, Ll/th0$a;

    .line 76
    .line 77
    iget-object p2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    invoke-direct {p1, p2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 80
    .line 81
    .line 82
    const-string p2, "\u786e\u5b9a\u8981\u53d6\u6d88\u559c\u6b22\u5417\uff1f"

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->xk:I

    .line 89
    .line 90
    invoke-virtual {p1, p2}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance p2, Ll/f6m0;

    .line 95
    .line 96
    invoke-direct {p2, p0}, Ll/f6m0;-><init>(Ll/w6m0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    sget p2, Ll/n9c0;->d:I

    .line 104
    .line 105
    invoke-virtual {p1, p2}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 114
    .line 115
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p1, p0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public h4()Ll/vak0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w6m0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->profileData:Ll/vak0;

    .line 4
    .line 5
    return-object p0
.end method

.method public h5(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "receiver_user_id"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "message_from"

    .line 8
    .line 9
    const-string v2, "AudioProfileCard"

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "e_anonymous_chat_button"

    .line 20
    .line 21
    const-string v2, "p_audio_profile"

    .line 22
    .line 23
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 27
    .line 28
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-virtual {v0, p0, p1}, Ll/wrv;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public i4()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/atm0;->i4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/k5m0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/k5m0;->I0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i5(Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "check act is null:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "voiceUserCard"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-virtual {v1, v2, p1, v3, v3}, Ll/wrv;->z0(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/w6m0;->J4()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public j5(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "anchorId"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i6t;->j3()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

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
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "liveId"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "receiver_user_id"

    .line 28
    .line 29
    invoke-static {v2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    filled-new-array {v0, v1, v2}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "e_audio_greeting"

    .line 38
    .line 39
    const-string v2, "p_audio_profile"

    .line 40
    .line 41
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 45
    .line 46
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    invoke-virtual {v0, v1, p1}, Ll/wrv;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/w6m0;->J4()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public k5(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualUserDressUpDlgEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualUserDressUpDlgEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualUserDressUpDlgEvent;->openDressUpDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final l5(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
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
    invoke-virtual {v0}, Ll/oo2;->m2()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/r6m0;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/r6m0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/s6m0;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Ll/s6m0;-><init>(Ll/w6m0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/t6m0;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/t6m0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/u6m0;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1}, Ll/u6m0;-><init>(Ll/w6m0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/v6m0;

    .line 52
    .line 53
    invoke-direct {v1, p0, p1}, Ll/v6m0;-><init>(Ll/w6m0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v0, Ll/d6m0;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/d6m0;-><init>(Ll/w6m0;)V

    .line 71
    .line 72
    .line 73
    new-instance v1, Ll/e6m0;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/e6m0;-><init>(Ll/w6m0;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public m5(Ll/vak0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/w6m0;->J4()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object p1, p1, Ll/vak0;->c:Ll/nsv;

    .line 8
    .line 9
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/rwn0;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Ll/rwn0;

    .line 34
    .line 35
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v2, v0}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    invoke-static {p0, p1}, Ll/ydn0;->d(Ll/i6t;Ll/nsv;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    if-eqz v1, :cond_2

    .line 52
    .line 53
    invoke-static {p0, v0, v1}, Ll/ydn0;->h(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_0
    return-void
.end method

.method public n5(Ll/nsv;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/w6m0;->J4()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1}, Ll/ydn0;->d(Ll/i6t;Ll/nsv;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final o5(Z)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v1, v0

    .line 6
    check-cast v1, Ll/rwn0;

    .line 7
    .line 8
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/atm0;->f4()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    const-string v5, "profileCard"

    .line 15
    .line 16
    const-string v6, "p_audio_profile"

    .line 17
    .line 18
    move v4, p1

    .line 19
    invoke-virtual/range {v1 .. v6}, Ll/rwn0;->a3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/g6m0;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/g6m0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/h6m0;

    .line 37
    .line 38
    invoke-direct {v0, p0, v4}, Ll/h6m0;-><init>(Ll/w6m0;Z)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public p5(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/w6m0;->m:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/w6m0;->l5(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;->openManageDialogWithSource()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ll/zdm0;->q:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/i6t;->f3(Ll/v3f$b;)Ll/i6t$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/c6m0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/c6m0;-><init>(Ll/w6m0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/i6t;->f3(Ll/v3f$b;)Ll/i6t$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/n6m0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/n6m0;-><init>(Ll/w6m0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftWallDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;->openGiftDialogFromGiftWall()Ll/v3f$c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Ll/i6t;->f3(Ll/v3f$b;)Ll/i6t$a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/o6m0;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/o6m0;-><init>(Ll/w6m0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Ll/p6m0;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/p6m0;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ll/i6t;->u3(Ll/qcj;)Ll/i6t$a;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/q6m0;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/q6m0;-><init>(Ll/w6m0;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
