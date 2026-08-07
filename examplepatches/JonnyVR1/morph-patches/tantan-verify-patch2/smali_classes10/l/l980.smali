.class public Ll/l980;
.super Ll/sx70;
.source "SourceFile"


# instance fields
.field public final q:Ll/t980;

.field public final r:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

.field public s:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->pkViewInternal:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/sx70;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/t980;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/t980;-><init>(Ll/dum;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/t980;

    .line 16
    .line 17
    iput-object p1, p0, Ll/l980;->q:Ll/t980;

    .line 18
    .line 19
    iget-object v0, p0, Ll/sx70;->i:Ll/xx70;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/xx70;->R3(Ll/v2m;)V

    .line 22
    .line 23
    .line 24
    iput-object p2, p0, Ll/l980;->r:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic r4(Ll/l980;Ll/fyb;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l980;->w4(Ll/fyb;)V

    return-void
.end method

.method private reset()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sx70;->k:Ll/h8b0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/h8b0;->R3()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/l980;->q:Ll/t980;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/t980;->reset()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/sx70;->j:Ll/k780;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/k780;->d4()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/n180;->h()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/sx70;->W3()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic s4(Ll/l980;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l980;->x4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method

.method private u4(I)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->ACTION_CTYP_TO_NORMAL:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/l980;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private v4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l980;->r:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Ll/sx70;->i:Ll/xx70;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->pkId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ll/xx70;->X3(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/l980;->r:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->pkId:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Ll/l980;->s:Ljava/lang/String;

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "enter room pk id= "

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/l980;->s:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic w4(Ll/fyb;)V
    .locals 0

    .line 1
    iget p1, p1, Ll/fyb;->a:I

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/l980;->u4(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private x4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const v2, -0x33863113    # -6.5485748E7f

    .line 12
    .line 13
    .line 14
    if-eq v1, v2, :cond_3

    .line 15
    .line 16
    const v2, -0x1d6b2fd2

    .line 17
    .line 18
    .line 19
    if-eq v1, v2, :cond_1

    .line 20
    .line 21
    const p0, 0x5c2caba

    .line 22
    .line 23
    .line 24
    if-eq v1, p0, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    const-string p0, "ended"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const-string v1, "playing"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_4

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/sx70;->S3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isOnceMore()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    invoke-direct {p0}, Ll/l980;->y4()V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->updateCurrentPk()Ll/v3f$d;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    :goto_0
    iget-object p1, p0, Ll/sx70;->i:Ll/xx70;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/xx70;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-direct {p0, p1}, Ll/l980;->z4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    const-string v1, "punishing"

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    iget-object v0, p0, Ll/sx70;->j:Ll/k780;

    .line 90
    .line 91
    const/4 v1, 0x1

    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lastStateIsPlaying()Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-virtual {v0, v1, p1, v2}, Ll/k780;->v4(ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Z)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, p1}, Ll/sx70;->S3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 100
    .line 101
    .line 102
    :cond_4
    :goto_1
    return-void
.end method

.method private y4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sx70;->j:Ll/k780;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/k780;->t4()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/sx70;->k:Ll/h8b0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/h8b0;->R3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private z4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "showPkView pkdata state "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPking()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v1, "showPkView "

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/sx70;->j:Ll/k780;

    .line 52
    .line 53
    const/4 v0, 0x1

    .line 54
    invoke-virtual {p0, v0, p1, v0}, Ll/k780;->v4(ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Z)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method


# virtual methods
.method public V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/sx70;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/l980$a;->a:[I

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    aget v0, v0, v1

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Ll/l980;->q:Ll/t980;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->getExtra()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLivePkStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/t980;->O3(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object p1, p0, Ll/sx70;->j:Ll/k780;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/k780;->d4()V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/l980;->q:Ll/t980;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/t980;->reset()V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/n180;->h()V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/sx70;->k:Ll/h8b0;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/h8b0;->R3()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/sx70;->W3()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkEndEvent()Ll/v3f$c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public a4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkMuteInfo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkMute;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/sx70;->T3()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkMute;->getPkId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkMute;->getMuted()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Ll/l980;->t4()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Ll/c680;->k(ZLjava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkMute;->getMuted()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->y0(Z)V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    return-void
.end method

.method public m4(ZLjava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0, p2}, Ll/c680;->k(ZLjava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/l980;->reset()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/sx70;->t()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/l980;->v4()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/sx70;->i:Ll/xx70;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/xx70;->P3()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/j980;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/j980;-><init>(Ll/l980;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->ctypChanged()Ll/v3f$d;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lrx/c;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/k980;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/k980;-><init>(Ll/l980;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public t4()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sx70;->i:Ll/xx70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xx70;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPking()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, ""

    .line 21
    .line 22
    return-object p0
.end method
