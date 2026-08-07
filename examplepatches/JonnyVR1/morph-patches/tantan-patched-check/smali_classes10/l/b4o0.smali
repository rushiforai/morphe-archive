.class public Ll/b4o0;
.super Ll/q4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/q4<",
        "Ll/jlm0;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
        "Ll/uzn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

.field public final j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;Ll/jlm0;)V
    .locals 3

    .line 1
    new-instance v0, Ll/uzn0;

    .line 2
    .line 3
    new-instance v1, Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/tantan/live/eventbus/LiveEventBus;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p1, p3, v1}, Ll/uzn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ll/jlm0;Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Ll/q4;-><init>(Ll/dum;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    sget v0, Ll/yec0;->s7:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {p3, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;

    .line 27
    .line 28
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 29
    .line 30
    invoke-virtual {v0, p0, p3}, Ll/dum;->a(Ll/njt;Landroid/view/ViewGroup;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p3}, Ll/l6t;->C(Ll/iam;)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/b4o0;->i:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 37
    .line 38
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->anchorSource:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p1, p0, Ll/b4o0;->j:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    check-cast p3, Ll/jlm0;

    .line 47
    .line 48
    invoke-virtual {p3, p1}, Ll/rwn0;->H3(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Ll/jlm0;

    .line 56
    .line 57
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->voiceEntranceType:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p1, p3}, Ll/jlm0;->T3(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Ll/jlm0;

    .line 67
    .line 68
    iget-boolean p1, p2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->isFromFloatWindow:Z

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ll/rwn0;->L3(Z)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static synthetic R3(Ll/b4o0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b4o0;->X3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic S3(Ll/b4o0;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b4o0;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    return-void
.end method

.method public static synthetic T3(Ll/b4o0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b4o0;->W3(Ll/jsv;)V

    return-void
.end method

.method private synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jlm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/oo2;->T0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic W3(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/njt;->M3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic X3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;

    .line 10
    .line 11
    iget-object p1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/jlm0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ll/jlm0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;

    .line 42
    .line 43
    iget-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 44
    .line 45
    const-string v0, "static"

    .line 46
    .line 47
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public N3()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Landroid/view/View;

    .line 4
    .line 5
    return-object p0
.end method

.method public O3(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/16 v0, 0x64

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    if-ne p2, p1, :cond_0

    .line 7
    .line 8
    const-string p1, "room_tag"

    .line 9
    .line 10
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/jlm0;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/rwn0;->i(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/zrv;->r()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pvn$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/pvn$a;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "voice"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/pvn;->c(Ljava/lang/String;Ll/ga1;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/jlm0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/rwn0;->c2()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/jlm0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/oo2;->P1()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;

    .line 35
    .line 36
    iget-object v1, p0, Ll/b4o0;->i:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->k0(Lcom/p1/mobile/android/app/Frag;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ll/uzn0;

    .line 46
    .line 47
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;

    .line 50
    .line 51
    invoke-static {p0, v0, v1}, Ll/q3o0;->a(Ll/b4o0;Ll/uzn0;Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/njt;->L3()V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/z3o0;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/z3o0;-><init>(Ll/b4o0;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Ll/jlm0;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/rwn0;->y()Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/a4o0;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/a4o0;-><init>(Ll/b4o0;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Ll/jlm0;

    .line 112
    .line 113
    sget-object v0, Ll/yct;->b:Ll/yct;

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ll/vp20;->h(Ll/jsv;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public U3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->closeLive()Ll/v3f$c;

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

.method public n()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jlm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->k3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/jlm0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ll/jlm0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-super {p0}, Ll/i6t;->n()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 36
    .line 37
    iget-object v0, v0, Ll/dum;->m:Ll/w3o0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/l6t;->destroy()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ll/jlm0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ll/jlm0;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/rwn0;->k3()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {v0, v1}, Ll/rwn0;->c0(Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/l6t;->s2()V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/ain0;->f()Ll/ain0;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/ain0;->c()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public o()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jlm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->r()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/jlm0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/jsv;->g()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/b4o0;->U3()V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0
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
    check-cast v0, Ll/jlm0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Ll/jlm0;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v0, v2, v1}, Ll/jlm0;->e2(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->l0(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Ll/jlm0;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Ll/jlm0;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->refreshVoiceBg()Ll/v3f$d;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lrx/c;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/y3o0;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/y3o0;-><init>(Ll/b4o0;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method
