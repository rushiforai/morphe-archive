.class public Ll/ann0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/koo0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/koo0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/koo0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/ann0;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ann0;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method

.method public static synthetic K3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L3(Ll/ann0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ann0;->R3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    return-void
.end method

.method public static synthetic M3(Ll/ann0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ann0;->P3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic N3(Ll/ann0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ann0;->T3(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic P3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ann0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/ann0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/koo0;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {v0, p1}, Ll/koo0;->F(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ann0;->V3()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic R3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ann0;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
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
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/koo0;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Ll/koo0;->F(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public O3(Ljava/lang/String;)V
    .locals 2

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
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topicIds:Ljava/util/List;

    .line 14
    .line 15
    const-string v1, "topic,title"

    .line 16
    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->fields:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v1, p0, Ll/ann0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Ll/rwn0;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1, v0}, Ll/itv;->I(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/ymn0;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/ymn0;-><init>(Ll/ann0;)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Ll/zmn0;

    .line 52
    .line 53
    invoke-direct {p0}, Ll/zmn0;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/koo0;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/rwn0;->O2()Ll/szn0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/szn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->needTitle:Z

    .line 22
    .line 23
    invoke-virtual {v0, v1, p0, p1}, Ll/koo0;->E(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Z)V

    .line 24
    .line 25
    .line 26
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
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceTopicEvent;->voiceInfoDialogVisibleEvent()Ll/v3f$d;

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
    new-instance v1, Ll/vmn0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/vmn0;-><init>(Ll/ann0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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

.method public final synthetic T3(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/koo0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/rwn0;->O2()Ll/szn0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/szn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x1

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p1, v1, p0, v0}, Ll/koo0;->E(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public U3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ann0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 2
    .line 3
    return-void
.end method

.method public final V3()V
    .locals 3

    .line 1
    invoke-static {}, Ll/itv;->C()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/wmn0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/wmn0;-><init>(Ll/ann0;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/xmn0;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/xmn0;-><init>(Ll/ann0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method
