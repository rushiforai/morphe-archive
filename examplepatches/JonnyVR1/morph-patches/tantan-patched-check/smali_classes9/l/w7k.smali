.class public Ll/w7k;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;",
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;",
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


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;->getOtherUserId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->otherUserId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;->getId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->userId:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;->getLovePoint()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->lovePoint:J

    .line 38
    .line 39
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;->getOtherUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->otherUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;->getHatUrl()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->hatUrl:Ljava/lang/String;

    .line 54
    .line 55
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voice.grabHat.cp"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/w7k;->B(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/w7k;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatCp;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
