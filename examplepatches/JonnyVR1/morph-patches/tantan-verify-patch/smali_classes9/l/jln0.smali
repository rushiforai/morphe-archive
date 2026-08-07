.class public Ll/jln0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;->getPoint()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    long-to-double v1, v1

    .line 10
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;->point:D

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;->getHatUrl()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;->hatUrl:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;->getUserId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;->userId:Ljava/lang/String;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->callHatInfo:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public C(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public D(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getLiveId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->liveId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getStatus()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->status:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getToast()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->toast:Ljava/lang/String;

    .line 28
    .line 29
    new-instance p1, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->callHatInfo:Ljava/util/List;

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getCallHatInfosList()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance v0, Ll/iln0;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/iln0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getUpdatedTime()J

    .line 49
    .line 50
    .line 51
    move-result-wide p1

    .line 52
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->updateTime:J

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->toJson()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voice.grabHat"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jln0;->C(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jln0;->D(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
