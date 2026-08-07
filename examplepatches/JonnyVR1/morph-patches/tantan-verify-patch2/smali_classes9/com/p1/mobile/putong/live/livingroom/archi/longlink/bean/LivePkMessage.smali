.class public Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private bulletMessage:Ljava/lang/String;

.field public id:Ljava/lang/String;

.field public inviteMsg:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInviteNotify;

.field public isOnceMore:Z

.field public pkEnd:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;

.field public pkExecuteConfig:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteConfig;

.field public pkExecuteInfo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

.field public pkInfo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;

.field public pkMuteInfo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkMute;

.field public pkPunishMotion:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;

.field public pkPunishmentSelect:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentSelect;

.field public pkResult:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkResult;

.field public serverTimeTs:J

.field public type:Ljava/lang/String;

.field public userPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteConfig;Ljava/lang/String;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;-><init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;Ljava/lang/String;)V

    .line 21
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkExecuteConfig:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteConfig;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;->getId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkInfo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;->getIsOnceMore()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->isOnceMore:Z

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->id:Ljava/lang/String;

    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    return-void
.end method

.method private transData(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPlayingBuffInfo;)Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPlayingBuffInfo;->getType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPlayingBuffInfo;->getText()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->text:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPlayingBuffInfo;->getStartTs()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->startTs:J

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPlayingBuffInfo;->getDuration()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->duration:I

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPlayingBuffInfo;->getShowCountdown()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->showCountdown:Z

    .line 34
    .line 35
    return-object p0
.end method


# virtual methods
.method public bulletText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->bulletMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPkMvpGrade()J
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkPunishMotion:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-wide v1

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;->getMvpUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    return-wide v1

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkPunishMotion:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;->getMvpUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getGrade()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    return-wide v1

    .line 32
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkPunishMotion:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;->getMvpUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getGrade()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    return-wide v0
.end method

.method public getPkMvpUid()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkPunishmentSelect:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentSelect;

    .line 2
    .line 3
    const-string v1, "null"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object v1

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentSelect;->getMvpUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkPunishmentSelect:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentSelect;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentSelect;->getMvpUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public getPlayingBuffInfo()Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkInfo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;->getPlayingBuffInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPlayingBuffInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->transData(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPlayingBuffInfo;)Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public isPkCreateMessage()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "pk_created"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setBulletText(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->bulletMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setInviteMsg(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInviteNotify;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->inviteMsg:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInviteNotify;

    .line 2
    .line 3
    return-object p0
.end method

.method public setOnceMore(Z)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->isOnceMore:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setPkEnd(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkEnd:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPkMuteInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkMute;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkMuteInfo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkMute;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPkPunishMotion(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkPunishMotion:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentMotion;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPkPunishmentSelect(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentSelect;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkPunishmentSelect:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPunishmentSelect;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPkResult(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkResult;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkResult:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPoints(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;",
            ">;)",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->userPoints:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LivePkMessage{pkInfo="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkInfo:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfo;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", type=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', id=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', pkResult="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkResult:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkResult;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", pkEnd="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->pkEnd:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkEnd;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", inviteMsg="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->inviteMsg:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInviteNotify;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", isOnceMore="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->isOnceMore:Z

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const/16 p0, 0x7d

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method
