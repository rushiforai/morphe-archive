.class public Ll/ef50;
.super Ll/x5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/x5<",
        "Ll/mc50;",
        "Lcom/p1/mobile/putong/live/base/data/BLive;",
        "Ll/ad50;",
        "Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

.field public final k:Ll/ogd0;

.field public l:Ll/kcg0;

.field public m:Ll/kcg0;

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ad50;Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/x5;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/dum;->f:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 7
    .line 8
    iput-object v0, p0, Ll/ef50;->j:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 9
    .line 10
    iput-object p2, p0, Ll/ef50;->k:Ll/ogd0;

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Ll/l6t;->C(Ll/iam;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p2, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {p1, p0, p2}, Ll/dum;->a(Ll/njt;Landroid/view/ViewGroup;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic A4(Ll/hmd0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private B4(Ll/v9s;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/v9s;->l()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->dismissDialog()Ll/v3f$c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/mc50;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-virtual {p1}, Ll/v9s;->n()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorLiveId:Ljava/lang/String;

    .line 49
    .line 50
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 61
    .line 62
    invoke-virtual {v2}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    check-cast v4, Ll/mc50;

    .line 71
    .line 72
    invoke-virtual {v4}, Ll/vp20;->x()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    const-string v4, ""

    .line 77
    .line 78
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;->X1(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const-string v0, ""

    .line 91
    .line 92
    invoke-static {p1, v0, v3}, Lcom/p1/mobile/putong/live/LiveDialogAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method private E4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/bri0;

    .line 29
    .line 30
    invoke-direct {p1, p3}, Ll/bri0;-><init>(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic j4(Ll/ef50;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ef50;->z4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic k4(Ll/ef50;Ll/hmd0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ef50;->A4(Ll/hmd0;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l4(Ll/ef50;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ef50;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    return-void
.end method

.method public static synthetic m4()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n4(Ll/ef50;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ef50;->w4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic o4(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic p4(Ll/ef50;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ef50;->v4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic q4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r4(Ll/ef50;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ef50;->y4(Ll/jsv;)V

    return-void
.end method

.method private s4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ef50;->m:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->getGiftWidthObs()Lrx/c;

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
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/af50;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/af50;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/bf50;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/bf50;-><init>(Ll/ef50;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/cf50;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/cf50;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/ef50;->m:Ll/kcg0;

    .line 54
    .line 55
    return-void
.end method

.method private synthetic v4(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->changeInputSize()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Landroid/util/Size;

    .line 12
    .line 13
    invoke-static {}, Ll/bnl0;->y0()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-int/2addr v1, p1

    .line 22
    const/high16 p1, 0x42600000    # 56.0f

    .line 23
    .line 24
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    sub-int/2addr v1, p1

    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-direct {v0, v1, p1}, Landroid/util/Size;-><init>(II)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic w4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/njt;->M3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic x4(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/mc50;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/oo2;->T0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic y4(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/mc50;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/mc50;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p1, v0, p0}, Ll/ou40;->e2(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private synthetic z4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "room presenter received control message,"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[live]msg_observer_handler"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const-string v2, ""

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    sparse-switch v1, :sswitch_data_0

    .line 30
    .line 31
    .line 32
    goto/16 :goto_2

    .line 33
    .line 34
    :sswitch_0
    const-string p1, "delete_manager"

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    goto/16 :goto_1

    .line 43
    .line 44
    :sswitch_1
    const-string v1, "forbidden_multidevice"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->isAnchor:Z

    .line 53
    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 57
    .line 58
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->T5:I

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 66
    .line 67
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->R5:I

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Ll/mc50;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Ll/mc50;

    .line 84
    .line 85
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/ef50;->t4()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0, v2, p1}, Lcom/p1/mobile/putong/live/LiveDialogAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :sswitch_2
    const-string v1, "force_stop"

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_2

    .line 117
    .line 118
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Ll/mc50;

    .line 123
    .line 124
    sget-object v1, Ll/v9s;->e:Ll/v9s;

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ll/vp20;->h(Ll/jsv;)V

    .line 127
    .line 128
    .line 129
    new-instance v0, Ll/v9s;

    .line 130
    .line 131
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 132
    .line 133
    invoke-direct {v0, p1, v3}, Ll/v9s;-><init>(Ljava/lang/String;Z)V

    .line 134
    .line 135
    .line 136
    invoke-direct {p0, v0}, Ll/ef50;->B4(Ll/v9s;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :sswitch_3
    const-string p0, "start"

    .line 141
    .line 142
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :sswitch_4
    const-string p1, "pause"

    .line 147
    .line 148
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_2

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    check-cast p0, Ll/mc50;

    .line 159
    .line 160
    sget-object p1, Ll/qcu;->b:Ll/qcu;

    .line 161
    .line 162
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :sswitch_5
    const-string p1, "stop"

    .line 167
    .line 168
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-eqz p1, :cond_2

    .line 173
    .line 174
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    check-cast p0, Ll/mc50;

    .line 179
    .line 180
    sget-object p1, Ll/v9s;->e:Ll/v9s;

    .line 181
    .line 182
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :sswitch_6
    const-string v1, "boot"

    .line 187
    .line 188
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_2

    .line 193
    .line 194
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 195
    .line 196
    new-instance v1, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    const-string v3, "live boot handle2 with content"

    .line 199
    .line 200
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    iget-object v3, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    check-cast v0, Ll/mc50;

    .line 223
    .line 224
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    check-cast v1, Ll/mc50;

    .line 229
    .line 230
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-virtual {v0, v1}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0}, Ll/ef50;->t4()V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->isFromLiveRoomBlock()Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-eqz v0, :cond_1

    .line 252
    .line 253
    const/4 v0, 0x2

    .line 254
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    if-eqz v0, :cond_1

    .line 259
    .line 260
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 261
    .line 262
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 271
    .line 272
    invoke-static {p0, v2, p1}, Lcom/p1/mobile/putong/live/LiveDialogAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    return-void

    .line 276
    :sswitch_7
    const-string p1, "chat_tip_change"

    .line 277
    .line 278
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    if-eqz p1, :cond_2

    .line 283
    .line 284
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 285
    .line 286
    .line 287
    move-result-object p0

    .line 288
    check-cast p0, Ll/mc50;

    .line 289
    .line 290
    invoke-virtual {p0}, Ll/oo2;->L1()V

    .line 291
    .line 292
    .line 293
    return-void

    .line 294
    :sswitch_8
    const-string p1, "re_request_room_gift_list"

    .line 295
    .line 296
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    if-eqz p1, :cond_2

    .line 301
    .line 302
    invoke-static {v3}, Ll/muj;->w(Z)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    if-eqz p1, :cond_2

    .line 310
    .line 311
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    check-cast p1, Ll/mc50;

    .line 316
    .line 317
    invoke-virtual {p1}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    if-eqz p1, :cond_2

    .line 322
    .line 323
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    check-cast p1, Ll/mc50;

    .line 328
    .line 329
    new-instance v0, Ll/uxj$a;

    .line 330
    .line 331
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    check-cast v1, Ll/mc50;

    .line 336
    .line 337
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 342
    .line 343
    .line 344
    move-result-object v2

    .line 345
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    check-cast p0, Ll/mc50;

    .line 350
    .line 351
    invoke-virtual {p0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    invoke-static {v2, p0}, Ll/mc50;->R2(Ll/oo2;Ljava/lang/String;)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    const-string v2, "live"

    .line 360
    .line 361
    invoke-direct {v0, v1, p0, v2}, Ll/uxj$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v0}, Ll/uxj$a;->f()Ll/uxj;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    const/4 v0, 0x0

    .line 369
    invoke-virtual {p1, p0, v0}, Ll/oo2;->A1(Ll/uxj;Ll/y20;)V

    .line 370
    .line 371
    .line 372
    return-void

    .line 373
    :sswitch_9
    const-string v1, "system"

    .line 374
    .line 375
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 376
    .line 377
    .line 378
    move-result v0

    .line 379
    if-eqz v0, :cond_2

    .line 380
    .line 381
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 382
    .line 383
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 384
    .line 385
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 386
    .line 387
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    new-instance v1, Ll/df50;

    .line 392
    .line 393
    invoke-direct {v1}, Ll/df50;-><init>()V

    .line 394
    .line 395
    .line 396
    invoke-direct {p0, p1, v0, v1}, Ll/ef50;->E4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 397
    .line 398
    .line 399
    return-void

    .line 400
    :sswitch_a
    const-string p0, "live_pull_update_video_quality"

    .line 401
    .line 402
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 403
    .line 404
    .line 405
    return-void

    .line 406
    :sswitch_b
    const-string p1, "add_manager"

    .line 407
    .line 408
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 409
    .line 410
    .line 411
    move-result p1

    .line 412
    if-eqz p1, :cond_2

    .line 413
    .line 414
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 415
    .line 416
    .line 417
    move-result-object p1

    .line 418
    check-cast p1, Ll/mc50;

    .line 419
    .line 420
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    check-cast p0, Ll/mc50;

    .line 425
    .line 426
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object p0

    .line 430
    invoke-virtual {p1, p0}, Ll/dw40;->K1(Ljava/lang/String;)V

    .line 431
    .line 432
    .line 433
    :cond_2
    :goto_2
    return-void

    .line 434
    nop

    .line 435
    :sswitch_data_0
    .sparse-switch
        -0x7f9401f1 -> :sswitch_b
        -0x71054394 -> :sswitch_a
        -0x34e38dd1 -> :sswitch_9
        -0x33a7a8db -> :sswitch_8
        -0x1ce5c8e5 -> :sswitch_7
        0x2e3af2 -> :sswitch_6
        0x360802 -> :sswitch_5
        0x65825f6 -> :sswitch_4
        0x68ac462 -> :sswitch_3
        0x80850d6 -> :sswitch_2
        0x169d3189 -> :sswitch_1
        0x40206119 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public C4(ZLcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    return-void
.end method

.method public D4(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->quickPlay()Ll/v3f$d;

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

.method public J3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/njt;->J3()V

    .line 2
    .line 3
    .line 4
    const-string p0, "context_single_room"

    .line 5
    .line 6
    invoke-static {p0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public N3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/ef50;->n:Ljava/lang/String;

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PreLoadEvent:Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;->cleanPreLoad()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public O3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 4
    .line 5
    invoke-static {p0}, Ll/u9t;->c(Ll/oo2;)Z

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
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public P3()V
    .locals 0

    .line 1
    return-void
.end method

.method public R3()Landroid/view/View;
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

.method public bridge synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Ll/y20;Z)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/ef50;->u4(Lcom/p1/mobile/putong/live/base/data/BLive;ZLl/y20;Ll/y20;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T3(Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;->initSmallWindowRoomInfo()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/vgd0;

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    move-object v1, p1

    .line 18
    invoke-direct/range {v0 .. v5}, Ll/vgd0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public U3(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public V3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public W3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ef50;->n:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public X3(I)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object p1, p1, Ll/dum;->h:Ll/oo2;

    .line 4
    .line 5
    invoke-static {p1}, Ll/u9t;->c(Ll/oo2;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->closeLive()Ll/v3f$c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public Y3(ZZ)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public Z3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ef50;->k:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->h1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a4()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic b4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ef50;->C4(ZLcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic c4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ef50;->D4(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e4(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/mc50;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/ou40;->O2(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f4(Ll/qwl;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->updatePlayer()Ll/v3f$d;

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

.method public g4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->setSwallowAllTouchEvent(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i4()V
    .locals 3

    .line 1
    invoke-static {}, Ll/zrv;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ef50;->k:Ll/ogd0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ogd0;->x0()Ll/u4j;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ll/mer;->I2(Ll/dum;)Ll/l6t;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/ad50;

    .line 26
    .line 27
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

    .line 30
    .line 31
    invoke-static {p0, v0, v1}, Ll/de50;->a(Ll/ef50;Ll/ad50;Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;)V

    .line 32
    .line 33
    .line 34
    invoke-super {p0}, Ll/l6t;->T()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/mc50;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/oo2;->c2()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->C(Z)V

    .line 52
    .line 53
    .line 54
    invoke-direct {p0}, Ll/ef50;->s4()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/mc50;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/vp20;->y()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v2, Ll/ve50;

    .line 72
    .line 73
    invoke-direct {v2, p0}, Ll/ve50;-><init>(Ll/ef50;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

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
    new-instance v2, Ll/we50;

    .line 96
    .line 97
    invoke-direct {v2, p0}, Ll/we50;-><init>(Ll/ef50;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Ll/mc50;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v2, Ll/xe50;

    .line 122
    .line 123
    invoke-direct {v2, p0}, Ll/xe50;-><init>(Ll/ef50;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Ll/mc50;

    .line 138
    .line 139
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 140
    .line 141
    invoke-virtual {v0, v2}, Ll/oo2;->o1(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    new-instance v2, Ll/ye50;

    .line 146
    .line 147
    invoke-direct {v2, p0}, Ll/ye50;-><init>(Ll/ef50;)V

    .line 148
    .line 149
    .line 150
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iput-object v0, p0, Ll/ef50;->l:Ll/kcg0;

    .line 159
    .line 160
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Ll/mc50;

    .line 165
    .line 166
    invoke-virtual {v0}, Ll/oo2;->P1()V

    .line 167
    .line 168
    .line 169
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->f(I)V

    .line 174
    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->g(I)V

    .line 181
    .line 182
    .line 183
    const/4 v0, 0x0

    .line 184
    iput-object v0, p0, Ll/ef50;->n:Ljava/lang/String;

    .line 185
    .line 186
    new-instance v0, Ll/ze50;

    .line 187
    .line 188
    invoke-direct {v0, p0}, Ll/ze50;-><init>(Ll/ef50;)V

    .line 189
    .line 190
    .line 191
    const-class v1, Ll/hmd0;

    .line 192
    .line 193
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public init()V
    .locals 3

    .line 1
    new-instance v0, Ll/i5j;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ef50;->k:Ll/ogd0;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/i5j;-><init>(Ll/dum;Ll/ogd0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/ad50;

    .line 18
    .line 19
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

    .line 22
    .line 23
    invoke-static {p0, v0, v1}, Ll/de50;->b(Ll/ef50;Ll/ad50;Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

    .line 29
    .line 30
    iget-object p0, p0, Ll/ef50;->j:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->w(Ll/rgd0;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->showLoading()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 5
    .line 6
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l6t;->destroy()V

    .line 9
    .line 10
    .line 11
    const-string v0, "context_single_room"

    .line 12
    .line 13
    invoke-static {v0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ef50;->l:Ll/kcg0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ef50;->V3()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 28
    .line 29
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 30
    .line 31
    check-cast p0, Ll/mc50;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, v0}, Ll/ou40;->c0(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ll/mc50;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/ou40;->exit()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 48
    .line 49
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 50
    .line 51
    check-cast p0, Ll/mc50;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ou40;->H2()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public s2()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->s2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ef50;->m:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;->destroy()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public t4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ef50;->J3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u4(Lcom/p1/mobile/putong/live/base/data/BLive;ZLl/y20;Ll/y20;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            "Z",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/Exception;

    .line 10
    .line 11
    const-string v1, "initRoomInfo live.id is Null"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "[live][trace_problem]"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;->initRoomInfo()Ll/v3f$d;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v0, Ll/vgd0;

    .line 36
    .line 37
    move-object v2, p1

    .line 38
    move v3, p2

    .line 39
    move-object v4, p3

    .line 40
    move-object v1, p4

    .line 41
    move v5, p5

    .line 42
    invoke-direct/range {v0 .. v5}, Ll/vgd0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
