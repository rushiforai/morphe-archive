.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;",
        ">;"
    }
.end annotation


# instance fields
.field private avatarUrl:Ljava/lang/String;

.field private isHost:Z

.field private isPunishStage:Z

.field private isSuccess:Z

.field private isTied:Z

.field private rank:I

.field private score:J

.field private userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)I
    .locals 2

    .line 8
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->score:J

    iget-wide p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->score:J

    sub-long/2addr v0, p0

    long-to-int p0, v0

    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->compareTo(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getAvatarUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->avatarUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRank()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->rank:I

    .line 2
    .line 3
    return p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isHost()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isHost:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPunishStage()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isPunishStage:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSuccess()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isSuccess:Z

    .line 2
    .line 3
    return p0
.end method

.method public isTied()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isTied:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAvatarUrl(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->avatarUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setHost(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isHost:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setPunishStage(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isPunishStage:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setRank(I)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->rank:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setScore(J)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->score:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setSuccess(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isSuccess:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setTied(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isTied:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setUserId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "PkContributor{userId=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->userId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', avatarUrl=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->avatarUrl:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', isHost="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isHost:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", score="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->score:J

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", rank="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->rank:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", isPunishStage="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isPunishStage:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", isSuccess="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isSuccess:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", isTied="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isTied:Z

    .line 79
    .line 80
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const/16 p0, 0x7d

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method
