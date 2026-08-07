.class public Ll/qfo0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Landroid/widget/FrameLayout;

.field public j:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;Landroid/widget/FrameLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;",
            "Landroid/widget/FrameLayout;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/qfo0;->i:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic J3(Ll/qfo0;Ll/abo0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qfo0;->P3(Ll/abo0;)V

    return-void
.end method

.method public static synthetic K3(Ll/qfo0;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qfo0;->R3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method

.method public static synthetic L3(Ll/qfo0;Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qfo0;->O3(Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;)V

    return-void
.end method

.method public static synthetic M3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final synthetic O3(Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qfo0;->T3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P3(Ll/abo0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qfo0;->T3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 3

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->list:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    :goto_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/rwn0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/vp20;->r()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/high16 v1, 0x42300000    # 44.0f

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/rwn0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    goto :goto_1

    .line 59
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ll/rwn0;

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 70
    .line 71
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->THREE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    const/high16 v0, 0x41980000    # 19.0f

    .line 80
    .line 81
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    goto :goto_1

    .line 86
    :cond_3
    const/4 v0, 0x0

    .line 87
    :goto_1
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;

    .line 90
    .line 91
    iget-object p0, p0, Ll/qfo0;->i:Landroid/widget/FrameLayout;

    .line 92
    .line 93
    invoke-virtual {v1, p1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;->f(Ljava/util/List;Landroid/widget/FrameLayout;I)V

    .line 94
    .line 95
    .line 96
    :cond_4
    return-void
.end method

.method public S3(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->schema:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/bae0$a;

    .line 20
    .line 21
    const/16 v1, 0x514

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->schema:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

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
    invoke-virtual {v0}, Ll/aj1;->s()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/lfo0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/lfo0;-><init>(Ll/qfo0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;->motionSwitch()Ll/v3f$d;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lrx/c;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/mfo0;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/mfo0;-><init>(Ll/qfo0;)V

    .line 57
    .line 58
    .line 59
    new-instance p0, Ll/nfo0;

    .line 60
    .line 61
    invoke-direct {p0}, Ll/nfo0;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public T3()V
    .locals 5

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
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/rwn0;->p()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ll/rwn0;

    .line 38
    .line 39
    invoke-virtual {v3}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const/4 v4, 0x0

    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Ll/rwn0;

    .line 51
    .line 52
    invoke-virtual {v3}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v3}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_0

    .line 61
    .line 62
    if-nez v2, :cond_0

    .line 63
    .line 64
    const/4 v4, 0x1

    .line 65
    :cond_0
    if-eqz v2, :cond_1

    .line 66
    .line 67
    const-string v2, "anchor"

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    const-string v2, "audience"

    .line 71
    .line 72
    :goto_0
    if-eqz v4, :cond_2

    .line 73
    .line 74
    const-string v3, "-caller"

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    const-string v3, ""

    .line 78
    .line 79
    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-nez v3, :cond_3

    .line 88
    .line 89
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-nez v3, :cond_3

    .line 94
    .line 95
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getIntlLiveOperations(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Ll/ofo0;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/ofo0;-><init>(Ll/qfo0;)V

    .line 106
    .line 107
    .line 108
    new-instance p0, Ll/pfo0;

    .line 109
    .line 110
    invoke-direct {p0}, Ll/pfo0;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    :cond_3
    return-void
.end method

.method public final U3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qfo0;->j:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/qfo0;->j:Ll/kcg0;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qfo0;->U3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qfo0;->T3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
