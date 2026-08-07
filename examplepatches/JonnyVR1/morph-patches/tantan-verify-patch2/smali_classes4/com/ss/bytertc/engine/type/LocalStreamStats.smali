.class public Lcom/ss/bytertc/engine/type/LocalStreamStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioStats:Lcom/ss/bytertc/engine/type/LocalAudioStats;

.field public isScreen:Z

.field public rxQuality:I

.field public txQuality:I

.field public videoStats:Lcom/ss/bytertc/engine/type/LocalVideoStats;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/InternalLocalStreamStats;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/ss/bytertc/engine/type/LocalAudioStats;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/ss/bytertc/engine/InternalLocalStreamStats;->audioStats:Lcom/ss/bytertc/engine/InternalLocalAudioStats;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/ss/bytertc/engine/type/LocalAudioStats;-><init>(Lcom/ss/bytertc/engine/InternalLocalAudioStats;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/LocalVideoStats;

    .line 12
    .line 13
    iget-object v2, p1, Lcom/ss/bytertc/engine/InternalLocalStreamStats;->videoStats:Lcom/ss/bytertc/engine/InternalLocalVideoStats;

    .line 14
    .line 15
    invoke-direct {v1, v2}, Lcom/ss/bytertc/engine/type/LocalVideoStats;-><init>(Lcom/ss/bytertc/engine/InternalLocalVideoStats;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/ss/bytertc/engine/type/LocalStreamStats;->audioStats:Lcom/ss/bytertc/engine/type/LocalAudioStats;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/ss/bytertc/engine/type/LocalStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/LocalVideoStats;

    .line 21
    .line 22
    iget-boolean v0, p1, Lcom/ss/bytertc/engine/InternalLocalStreamStats;->isScreen:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/type/LocalStreamStats;->isScreen:Z

    .line 25
    .line 26
    iget v0, p1, Lcom/ss/bytertc/engine/InternalLocalStreamStats;->txQuality:I

    .line 27
    .line 28
    iput v0, p0, Lcom/ss/bytertc/engine/type/LocalStreamStats;->txQuality:I

    .line 29
    .line 30
    iget p1, p1, Lcom/ss/bytertc/engine/InternalLocalStreamStats;->rxQuality:I

    .line 31
    .line 32
    iput p1, p0, Lcom/ss/bytertc/engine/type/LocalStreamStats;->rxQuality:I

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "LocalStreamStats{audioStats="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/type/LocalStreamStats;->audioStats:Lcom/ss/bytertc/engine/type/LocalAudioStats;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", videoStats="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/engine/type/LocalStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/LocalVideoStats;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", isScreen="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/type/LocalStreamStats;->isScreen:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", txQuality="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/type/LocalStreamStats;->txQuality:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", rxQuality="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget p0, p0, Lcom/ss/bytertc/engine/type/LocalStreamStats;->rxQuality:I

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x7d

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
