.class public Ll/d24;
.super Ll/h84;
.source "SourceFile"


# instance fields
.field public j:Ll/zed0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Ll/zed0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/h84;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Ll/n54;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/d24;->j:Ll/zed0;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e4(Ll/d24;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d24;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method


# virtual methods
.method public P3(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d24;->j:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/n54;->Z3()Ll/qvd;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/qvd;->d(I)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->g1:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->v2:I

    .line 35
    .line 36
    new-instance v2, Ll/c24;

    .line 37
    .line 38
    invoke-direct {v2, p0, p1}, Ll/c24;-><init>(Ll/d24;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    return-void
.end method

.method public R3(Ll/qvd;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/h84;->R3(Ll/qvd;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1, v0}, Ll/qvd;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    move-object p1, p0

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 20
    .line 21
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;->n:Z

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;->L(Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;->setMinimizeVisible(Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public T3(Ll/qvd;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/h84;->T3(Ll/qvd;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Ll/qvd;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 5
    .line 6
    invoke-static {p1}, Ll/u54;->k(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    move-object p1, p0

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 18
    .line 19
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;->n:Z

    .line 20
    .line 21
    xor-int/lit8 p0, p0, 0x1

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;->setMinimizeVisible(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public Y3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->personalManager()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/u24;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/u24;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p2}, Ll/u24;->a(Ll/h64;)Ll/u24;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2, p1}, Ll/u24;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Ll/u24;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    new-instance p0, Ljava/lang/NullPointerException;

    .line 53
    .line 54
    const-string p1, "CallAudienceWidgetPresenter onClickDeputyPosIfHasCall data().getAnchor_() is null"

    .line 55
    .line 56
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 74
    .line 75
    const/16 v1, 0x1130

    .line 76
    .line 77
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;-><init>(I)V

    .line 78
    .line 79
    .line 80
    const-string v2, "callVoiceVice"

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->giftSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v3, p2, Ll/h64;->a:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {p0, v2, v3, v1}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 115
    .line 116
    iget-object v3, p2, Ll/h64;->a:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {p0, v2, v3, v1}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    iget-object p2, p2, Ll/h64;->a:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    const-string p2, "live"

    .line 133
    .line 134
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    const-string p2, "call"

    .line 139
    .line 140
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public Z3(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d24;->j:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/n54;->Z3()Ll/qvd;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/qvd;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->audienceCallAnchor()Ll/v3f$d;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    add-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final synthetic f4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d24;->j:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
