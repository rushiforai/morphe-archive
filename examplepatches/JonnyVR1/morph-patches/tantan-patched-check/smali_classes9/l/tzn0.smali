.class public Ll/tzn0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;",
        "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;",
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
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;",
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
.method public B(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;->getRewardPoint()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;->getRoomId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;->getLiveId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;->getLiveMode()Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo$VoiceLiveMode;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;->getTemplate()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;-><init>(JLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/VoiceLiveMode;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.voicelive.info"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/tzn0;->B(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/tzn0;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
