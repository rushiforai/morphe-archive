.class public Lcom/ss/bytertc/engine/type/RemoteStreamStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioStats:Lcom/ss/bytertc/engine/type/RemoteAudioStats;

.field public isScreen:Z

.field public rxQuality:I

.field public txQuality:I

.field public uid:Ljava/lang/String;

.field public videoStats:Lcom/ss/bytertc/engine/type/RemoteVideoStats;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/InternalRemoteStreamStats;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->audioStats:Lcom/ss/bytertc/engine/InternalRemoteAudioStats;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/ss/bytertc/engine/type/RemoteAudioStats;-><init>(Lcom/ss/bytertc/engine/InternalRemoteAudioStats;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;

    .line 12
    .line 13
    iget-object v2, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->videoStats:Lcom/ss/bytertc/engine/InternalRemoteVideoStats;

    .line 14
    .line 15
    invoke-direct {v1, v2}, Lcom/ss/bytertc/engine/type/RemoteVideoStats;-><init>(Lcom/ss/bytertc/engine/InternalRemoteVideoStats;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->audioStats:Lcom/ss/bytertc/engine/type/RemoteAudioStats;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/RemoteVideoStats;

    .line 21
    .line 22
    iget-object v0, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->uid:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->uid:Ljava/lang/String;

    .line 25
    .line 26
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->isScreen:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->isScreen:Z

    .line 29
    .line 30
    iget v0, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->rxQuality:I

    .line 31
    .line 32
    iput v0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->rxQuality:I

    .line 33
    .line 34
    iget p1, p1, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->txQuality:I

    .line 35
    .line 36
    iput p1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->txQuality:I

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RemoteStreamStats{uid=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->uid:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', audioStats="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->audioStats:Lcom/ss/bytertc/engine/type/RemoteAudioStats;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", videoStats="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/RemoteVideoStats;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", isScreen="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->isScreen:Z

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", txQuality="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->txQuality:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", rxQuality="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget p0, p0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->rxQuality:I

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const/16 p0, 0x7d

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method
