.class public Ll/v5m0;
.super Ll/atm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/atm0<",
        "Ll/t5m0<",
        "TD;>;TD;>;"
    }
.end annotation


# instance fields
.field public k:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/fko0;


# direct methods
.method public constructor <init>(Ll/dum;Lv/VImage;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lv/VImage;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/atm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/t5m0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/t5m0;-><init>(Landroid/widget/ImageView;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic l4(Ll/v5m0;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v5m0;->o4(Ljava/util/ArrayList;)V

    return-void
.end method

.method private m4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v5m0;->l:Ll/fko0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fko0;->j()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic o4(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/t5m0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/v5m0;->k:Ll/nsv;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/t5m0;->f(Ll/nsv;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/v5m0;->m4()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/v5m0;->k:Ll/nsv;

    .line 9
    .line 10
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Ll/vak0;->c:Ll/nsv;

    .line 17
    .line 18
    :goto_0
    iput-object v0, p0, Ll/v5m0;->k:Ll/nsv;

    .line 19
    .line 20
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v1, Ll/t5m0;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/t5m0;->f(Ll/nsv;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/rwn0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/oo2;->T1()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/u5m0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/u5m0;-><init>(Ll/v5m0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/v5m0;->m4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n4(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/oo2;->S0(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public p4(Ll/nsv;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/v5m0;->l:Ll/fko0;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Ll/fko0;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/fko0;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/v5m0;->l:Ll/fko0;

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/rwn0;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    :goto_0
    move v4, v1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    const/4 v1, 0x0

    .line 42
    goto :goto_0

    .line 43
    :goto_1
    iget-object v2, p0, Ll/v5m0;->l:Ll/fko0;

    .line 44
    .line 45
    iget-object v3, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Ll/rwn0;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Ll/rwn0;

    .line 62
    .line 63
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-virtual {p0}, Ll/atm0;->g4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getMessageId()J

    .line 72
    .line 73
    .line 74
    move-result-wide v8

    .line 75
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Ll/rwn0;

    .line 82
    .line 83
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v10

    .line 93
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 94
    .line 95
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Li:I

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v11

    .line 101
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->voice:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 104
    .line 105
    .line 106
    move-result v12

    .line 107
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Ll/rwn0;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    iget-object v13, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 118
    .line 119
    move-object v5, p1

    .line 120
    invoke-virtual/range {v2 .. v13}, Ll/fko0;->p(Lcom/p1/mobile/android/app/Act;ZLl/nsv;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ILjava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public q4(Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "anchorId"

    .line 14
    .line 15
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/pf60;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ll/rwn0;

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "liveId"

    .line 31
    .line 32
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "e_audio_user_managment_button"

    .line 40
    .line 41
    const-string v2, "p_audio_profile"

    .line 42
    .line 43
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;->openManageDialogWithSource()Ll/v3f$d;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
