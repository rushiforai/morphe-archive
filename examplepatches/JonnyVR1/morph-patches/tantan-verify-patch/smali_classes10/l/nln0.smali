.class public Ll/nln0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceGrabHatFloatViewMode;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceGrabHatFloatViewMode;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/a9k;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/a9k;-><init>(Ll/dum;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/l8k;

    .line 13
    .line 14
    invoke-direct {v0, p1, p0}, Ll/l8k;-><init>(Ll/dum;Ll/nln0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/w8k;

    .line 21
    .line 22
    invoke-direct {v0, p1, p2}, Ll/w8k;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceGrabHatFloatViewMode;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic J3(Ll/nln0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nln0;->L3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/nln0;Ll/x8k;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nln0;->M3(Ll/x8k;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final L3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
            ">;"
        }
    .end annotation

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
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/eln0;->h(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic M3(Ll/x8k;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nln0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 2
    .line 3
    return-object p0
.end method

.method public N3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->toast:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->toast:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Ll/nln0;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/nln0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGrabHatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;->gameInfo()Ll/v3f$d;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/nln0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 40
    .line 41
    return-void
.end method

.method public final O3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nln0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/nln0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->status:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->status:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    :cond_0
    if-nez p1, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Ll/nln0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    :cond_1
    return-void

    .line 36
    :cond_2
    invoke-static {p1}, Ll/fln0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v2, "postGameState:"

    .line 43
    .line 44
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    if-nez p1, :cond_3

    .line 48
    .line 49
    const-string p1, "null"

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->status:Ljava/lang/String;

    .line 53
    .line 54
    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v1, "grabHat"

    .line 62
    .line 63
    invoke-static {v1, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGrabHatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;->openGrabHatGame()Ll/v3f$d;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nln0;->L3()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/kln0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/kln0;-><init>(Ll/nln0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/lln0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/lln0;-><init>(Ll/nln0;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/kln0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/kln0;-><init>(Ll/nln0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Ll/i6t;->C3(Ll/pcj;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/lln0;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/lln0;-><init>(Ll/nln0;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/kln0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/kln0;-><init>(Ll/nln0;)V

    .line 45
    .line 46
    .line 47
    const/16 v2, 0xa

    .line 48
    .line 49
    invoke-virtual {p0, v2, v0, v1}, Ll/i6t;->D3(ILl/pcj;Ll/y20;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ll/mln0;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/mln0;-><init>(Ll/nln0;)V

    .line 55
    .line 56
    .line 57
    const-class v1, Ll/x8k;

    .line 58
    .line 59
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ll/rwn0;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/aj1;->m()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/kln0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/kln0;-><init>(Ll/nln0;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    return-void
.end method
