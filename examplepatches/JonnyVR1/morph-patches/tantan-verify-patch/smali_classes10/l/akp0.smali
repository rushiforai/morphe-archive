.class public Ll/akp0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/ujp0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ujp0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/ujp0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/akp0;Ll/moo0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/akp0;->P3(Ll/moo0;)V

    return-void
.end method

.method public static synthetic K3(Ll/akp0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/akp0;->U3()V

    return-void
.end method

.method public static synthetic L3(Ll/akp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/akp0;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    return-void
.end method

.method public static synthetic M3(Ll/akp0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/akp0;->S3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N3(Ll/akp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/akp0;->R3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    return-void
.end method


# virtual methods
.method public O3(Ljava/lang/String;)V
    .locals 10

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "title,topic"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->addField(Ljava/lang/String;)V

    .line 11
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
    invoke-virtual {v1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_0

    .line 42
    .line 43
    new-instance v1, Ljava/util/ArrayList;

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Ll/rwn0;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 60
    .line 61
    const/4 v3, 0x0

    .line 62
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 67
    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->id:Ljava/lang/String;

    .line 69
    .line 70
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topicIds:Ljava/util/List;

    .line 74
    .line 75
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const-string v2, ""

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 82
    .line 83
    .line 84
    iget-object v3, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    const-string v1, "voice_room_name"

    .line 87
    .line 88
    invoke-static {v1}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    new-instance v8, Ll/wjp0;

    .line 97
    .line 98
    invoke-direct {v8, p0, v0}, Ll/wjp0;-><init>(Ll/akp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    .line 99
    .line 100
    .line 101
    new-instance v9, Ll/xjp0;

    .line 102
    .line 103
    invoke-direct {v9, p0}, Ll/xjp0;-><init>(Ll/akp0;)V

    .line 104
    .line 105
    .line 106
    const-string v6, "name"

    .line 107
    .line 108
    move-object v4, p1

    .line 109
    invoke-static/range {v3 .. v9}, Lcom/p1/mobile/putong/util/AntiSpamHelper;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final synthetic P3(Ll/moo0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ujp0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ujp0;->z(Ll/moo0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/akp0;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic S3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceTopicEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopicEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopicEvent;->showVoiceVirtualEditTitleDialog()Ll/v3f$d;

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
    new-instance v1, Ll/vjp0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/vjp0;-><init>(Ll/akp0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
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
    invoke-static {v0, p1}, Ll/itv;->I(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/yjp0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/yjp0;-><init>(Ll/akp0;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/zjp0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/zjp0;-><init>(Ll/akp0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic U3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 1

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
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/szn0;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualRoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;->updateRoomInfoDialogTitle()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Ll/ujp0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ujp0;->y()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
