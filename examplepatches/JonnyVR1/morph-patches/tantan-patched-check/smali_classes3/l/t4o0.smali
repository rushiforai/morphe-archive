.class public Ll/t4o0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/v4o0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/t4o0;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/t4o0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t4o0;->L3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;)V

    return-void
.end method


# virtual methods
.method public K3()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic L3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;->getUrl()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1, p1}, Ll/wlo0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ll/rwn0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/rwn0;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;->getPicType()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v1, p0, Ll/t4o0;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Ll/rwn0;

    .line 59
    .line 60
    invoke-virtual {v2}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;->hasCallPlaceResource()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    return-void

    .line 83
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceRoomBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;->onRoomBgChanged()Ll/v3f$c;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public M3(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/t4o0;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;->b()V

    .line 9
    .line 10
    .line 11
    :cond_0
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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->M0()Lrx/c;

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
    new-instance v1, Ll/s4o0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/s4o0;-><init>(Ll/t4o0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method
