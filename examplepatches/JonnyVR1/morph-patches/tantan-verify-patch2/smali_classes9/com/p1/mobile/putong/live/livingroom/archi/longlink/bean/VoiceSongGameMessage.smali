.class public Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceSongGameMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public statusNotice:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameStatusNotice;

.field public type:Ljava/lang/String;

.field public userNotice:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameStatusNotice;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceSongGameMessage;->statusNotice:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameStatusNotice;

    .line 13
    const-string p1, "live.game.voiceSongGameStatusNotice"

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceSongGameMessage;->type:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceSongGameMessage;->userNotice:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 5
    .line 6
    const-string p1, "live.game.voiceSongGameUserNotice"

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceSongGameMessage;->type:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VoiceSongGameMessage{userNotice="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceSongGameMessage;->userNotice:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", statusNotice="

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceSongGameMessage;->statusNotice:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameStatusNotice;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ", type=\'"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceSongGameMessage;->type:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p0, "\'}"

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method
