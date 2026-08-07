.class public Lcom/ss/bytertc/engine/data/MediaPlayerConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public autoPlay:Z

.field public callbackOnProgressInterval:J

.field public playCount:I

.field public startPos:I

.field public syncProgressToRecordFrame:Z

.field public type:Lcom/ss/bytertc/engine/data/AudioMixingType;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioMixingType;->AUDIO_MIXING_TYPE_PLAYOUT_AND_PUBLISH:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->type:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput v0, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->playCount:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->startPos:I

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    iput-wide v2, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->callbackOnProgressInterval:J

    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->syncProgressToRecordFrame:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->autoPlay:Z

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/data/AudioMixingType;I)V
    .locals 8

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    .line 23
    invoke-direct/range {v0 .. v7}, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;-><init>(Lcom/ss/bytertc/engine/data/AudioMixingType;IIZJZ)V

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/data/AudioMixingType;IIZJZ)V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioMixingType;->AUDIO_MIXING_TYPE_PLAYOUT:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 26
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->type:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 27
    iput p2, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->playCount:I

    .line 28
    iput p3, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->startPos:I

    .line 29
    iput-boolean p4, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->autoPlay:Z

    .line 30
    iput-boolean p7, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->syncProgressToRecordFrame:Z

    .line 31
    iput-wide p5, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->callbackOnProgressInterval:J

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MediaPlayerConfig{type=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->type:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', playCount=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->playCount:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', startPos=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->startPos:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', autoPlay=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->autoPlay:Z

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', syncProgressToRecordFrame=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->syncProgressToRecordFrame:Z

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', callbackOnProgressInterval=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-wide v1, p0, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->callbackOnProgressInterval:J

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p0, "\'}"

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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
