.class public Ll/pzl0;
.super Ll/d2m0;
.source "SourceFile"


# instance fields
.field public l:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/d2m0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isVoiceGaming:Z

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u4(Ll/pzl0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzl0;->A4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;)V

    return-void
.end method

.method public static synthetic v4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic w4(Ll/pzl0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceGameMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzl0;->x4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceGameMessage;)V

    return-void
.end method


# virtual methods
.method public final A4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pzl0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 2
    .line 3
    iget-object p1, p0, Ll/m1m0;->i:Lrx/subjects/a;

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
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/hrk0;->r()Ll/ado0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public X3(Ll/ado0;)V
    .locals 1
    .param p1    # Ll/ado0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/pzl0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/pzl0;->z4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Ll/s7m0;->X3(Ll/ado0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/s7m0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pzl0;->y4()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/aj1;->K()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/lzl0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/lzl0;-><init>(Ll/pzl0;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic x4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceGameMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzl0;->y4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y4()V
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
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/kzl0;->g(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/mzl0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/mzl0;-><init>(Ll/pzl0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final z4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;)V
    .locals 3

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
    invoke-virtual {v0}, Ll/hrk0;->p()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    new-instance v1, Ll/nzl0;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/nzl0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/pzl0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->userIds:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_3

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-ge p1, v1, :cond_3

    .line 49
    .line 50
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ljava/lang/String;

    .line 55
    .line 56
    new-instance v2, Ll/ozl0;

    .line 57
    .line 58
    invoke-direct {v2, v1}, Ll/ozl0;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 66
    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    iput-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isVoiceGaming:Z

    .line 71
    .line 72
    :cond_2
    add-int/lit8 p1, p1, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    :goto_1
    return-void
.end method
