.class public Ll/zfn0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K3(Ll/zfn0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zfn0;->U3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/zfn0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zfn0;->W3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic M3(Ll/zfn0;Ll/abo0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zfn0;->T3(Ll/abo0;)V

    return-void
.end method

.method public static synthetic N3(Ll/zfn0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zfn0;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V

    return-void
.end method

.method public static synthetic O3(ILcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->id:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private T3(Ll/abo0;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/abo0;->c:Ll/ram;

    .line 2
    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    instance-of v0, p1, Ll/f8o0;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    check-cast p1, Ll/f8o0;

    .line 10
    .line 11
    iget-object p1, p1, Ll/f8o0;->b:Ll/sam;

    .line 12
    .line 13
    instance-of v0, p1, Ll/qln0;

    .line 14
    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    instance-of v0, p1, Ll/sln0;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    instance-of v0, p1, Ll/uln0;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    instance-of v0, p1, Ll/hdn0;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    instance-of v0, p1, Ll/udo0;

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    instance-of v0, p1, Ll/k3p0;

    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    instance-of v0, p1, Ll/m3p0;

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    instance-of p1, p1, Ll/lfn0;

    .line 43
    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    :cond_1
    const/4 p1, 0x0

    .line 47
    iput-boolean p1, p0, Ll/zfn0;->i:Z

    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    :goto_0
    const/4 p1, 0x1

    .line 51
    iput-boolean p1, p0, Ll/zfn0;->i:Z

    .line 52
    .line 53
    invoke-static {}, Ll/qfn0;->f()V

    .line 54
    .line 55
    .line 56
    :cond_3
    return-void
.end method

.method private W3(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/jsv;->b()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    invoke-static {}, Ll/qfn0;->f()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final P3()Z
    .locals 2

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
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->EIGHT_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->THREE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->FIVE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 p0, 0x0

    .line 63
    return p0

    .line 64
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 65
    return p0
.end method

.method public final R3(Ljava/lang/String;)Lkotlin/Pair;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lkotlin/Pair<",
            "[I",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

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
    invoke-virtual {v0, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance p0, Lkotlin/Pair;

    .line 18
    .line 19
    const/4 p1, 0x2

    .line 20
    new-array p1, p1, [I

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-direct {p0, p1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    new-instance v1, Ll/nfn0;

    .line 32
    .line 33
    const/16 v2, 0x2328

    .line 34
    .line 35
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 36
    .line 37
    invoke-direct {v1, v2, v0, p1}, Ll/nfn0;-><init>(IILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Lkotlin/Pair;

    .line 45
    .line 46
    return-object p0
.end method

.method public final S3(I)Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;
    .locals 2

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
    invoke-virtual {p0, p1}, Ll/oo2;->w0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->resourceType:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "dynamic"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->resourceId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 36
    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->id:I

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    if-eqz p0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->endEffectIcon:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->startEffectIcon:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 67
    .line 68
    iput p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->id:I

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ll/vwt;->p4()Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    if-nez p0, :cond_2

    .line 84
    .line 85
    const/4 p0, 0x0

    .line 86
    return-object p0

    .line 87
    :cond_2
    new-instance v0, Ll/yfn0;

    .line 88
    .line 89
    invoke-direct {v0, p1}, Ll/yfn0;-><init>(I)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 97
    .line 98
    return-object p0
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMotionEvent;->motionSwitch()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/wfn0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/wfn0;-><init>(Ll/zfn0;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/xfn0;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/xfn0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/zfn0;->i:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zfn0;->P3()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V
    .locals 4

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->id:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/zfn0;->S3(I)Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->receiveUserId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ll/zfn0;->R3(Ljava/lang/String;)Lkotlin/Pair;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, [I

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->receiveUserId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, v2}, Ll/zfn0;->R3(Ljava/lang/String;)Lkotlin/Pair;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/Integer;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const/4 v3, 0x0

    .line 39
    aget v3, v1, v3

    .line 40
    .line 41
    if-eqz v3, :cond_4

    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    aget v3, v1, v3

    .line 45
    .line 46
    if-nez v3, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->endPosition:[I

    .line 50
    .line 51
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->resourceId:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->resourceId:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->resourceType:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->resourceType:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->startEffectIcon:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->startEffectIcon:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->endEffectIcon:Ljava/lang/String;

    .line 64
    .line 65
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->endEffectIcon:Ljava/lang/String;

    .line 66
    .line 67
    const-string v0, "dynamic"

    .line 68
    .line 69
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 76
    .line 77
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;->c(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    invoke-static {}, Ll/qfn0;->d()Ll/sfn0;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    if-nez v0, :cond_3

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 91
    .line 92
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 93
    .line 94
    invoke-virtual {p0, p1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;->d(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;Ll/sfn0;I)V

    .line 95
    .line 96
    .line 97
    :cond_4
    :goto_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/qfn0;->c()V

    .line 5
    .line 6
    .line 7
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
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/tfn0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/tfn0;-><init>(Ll/zfn0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceFlyEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceFlyEvent;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceFlyEvent;->playFlyMicAnim()Ll/v3f$d;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lrx/c;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/ufn0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/ufn0;-><init>(Ll/zfn0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/vfn0;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/vfn0;-><init>(Ll/zfn0;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
