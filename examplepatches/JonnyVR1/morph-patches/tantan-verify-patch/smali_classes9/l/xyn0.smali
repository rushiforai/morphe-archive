.class public Ll/xyn0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;",
        "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;",
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
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;",
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
.method public B(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;->getLiveId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;->getRoomId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;->getTimestamp()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;->getHeartBeats()J

    .line 16
    .line 17
    .line 18
    move-result-wide v5

    .line 19
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceLive.heartBeats.update"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/xyn0;->B(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/xyn0;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceLiveHeartBeatInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveHeartBeatInfoMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
