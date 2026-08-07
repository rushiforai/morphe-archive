.class public Ll/rzo0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/y8s<",
        "TD;",
        "Ll/qct;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ll/dum;

.field public k:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rzo0;->j:Ll/dum;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic S3(Ll/vxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic T3(Ll/rzo0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzo0;->X3(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V

    return-void
.end method

.method public static synthetic U3(Ll/rzo0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzo0;->W3(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V

    return-void
.end method


# virtual methods
.method public final V3(Z)Ll/rq2;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/rzo0;->k:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const p0, 0x3eb33333    # 0.35f

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/qag0;->d(FZ)Ll/rq2;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-static {p1}, Ll/qag0;->e(Z)Ll/rq2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic W3(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getAction()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->invite:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/e2p0;

    .line 10
    .line 11
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 12
    .line 13
    iget-object v1, v1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p0, v2}, Ll/rzo0;->V3(Z)Ll/rq2;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-direct {v0, v1, p0, v2}, Ll/e2p0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/rzo0;Ll/rq2;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/e2p0;->V(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getAction()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->agree:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    if-ne v0, v1, :cond_1

    .line 35
    .line 36
    new-instance v0, Ll/pyo0;

    .line 37
    .line 38
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 39
    .line 40
    iget-object v1, v1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    invoke-virtual {p0, v2}, Ll/rzo0;->V3(Z)Ll/rq2;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-direct {v0, v1, p0, v2}, Ll/pyo0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/rzo0;Ll/rq2;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ll/pyo0;->O(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceSweetEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;->undateRecommendUser()Ll/v3f$c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getAction()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->refuse:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 71
    .line 72
    if-ne v0, v1, :cond_2

    .line 73
    .line 74
    new-instance v0, Ll/w1p0;

    .line 75
    .line 76
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 77
    .line 78
    iget-object v1, v1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    invoke-virtual {p0, v2}, Ll/rzo0;->V3(Z)Ll/rq2;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-direct {v0, v1, p0, v2}, Ll/w1p0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/rzo0;Ll/rq2;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, p1}, Ll/w1p0;->L(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 3

    .line 1
    new-instance v0, Ll/x2p0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v1, v1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {p0, v2}, Ll/rzo0;->V3(Z)Ll/rq2;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {v0, v1, p0, v2}, Ll/x2p0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/rzo0;Ll/rq2;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/x2p0;->M(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public Y3(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceSweetEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;->showSweetCpDialog()Ll/v3f$d;

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

.method public Z3(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rzo0;->j:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const-string v1, "agree"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v1, "refuse"

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {v0, v1, p1}, Ll/fwo0;->t(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ll/qzo0;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/qzo0;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/r5k;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/r5k;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    if-eqz p2, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    const-string p0, "p_anchor_audio_room"

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const-string p0, "p_user_audio_room"

    .line 57
    .line 58
    :goto_1
    invoke-static {p0}, Ll/ryo0;->a(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public a4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceSweetEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceSweetEvent;->showSweetCpDialog()Ll/v3f$d;

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

.method public b4(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rzo0;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public c4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const-string v0, "0"

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public t()V
    .locals 2

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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->q1()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/ozo0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ozo0;-><init>(Ll/rzo0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/aj1;->s1()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/pzo0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/pzo0;-><init>(Ll/rzo0;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method
