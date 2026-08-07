.class public Lcom/momo/xengine/media/AudioTrack;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private audioSource:Ljava/lang/String;

.field private effectiveRange:Lcom/momo/xengine/media/types/TimeRange;

.field private endTime:J

.field private gain:F

.field private pitch:I

.field private repeat:Z

.field private speedNodes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xengine/media/types/AudioSpeedNode;",
            ">;"
        }
    .end annotation
.end field

.field private startTime:J

.field private trackID:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xengine/media/AudioTrack;->speedNodes:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/momo/xengine/media/AudioTrack;->trackID:I

    .line 16
    .line 17
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioTrack;->startTime:J

    .line 20
    .line 21
    const-wide/16 v0, -0x1

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioTrack;->endTime:J

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Lcom/momo/xengine/media/AudioTrack;->pitch:I

    .line 27
    .line 28
    const/high16 v1, 0x3f800000    # 1.0f

    .line 29
    .line 30
    iput v1, p0, Lcom/momo/xengine/media/AudioTrack;->gain:F

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/momo/xengine/media/AudioTrack;->repeat:Z

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public getAudioSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/AudioTrack;->audioSource:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEffectiveRange()Lcom/momo/xengine/media/types/TimeRange;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/AudioTrack;->effectiveRange:Lcom/momo/xengine/media/types/TimeRange;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEffectiveRangeBeginning()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/AudioTrack;->effectiveRange:Lcom/momo/xengine/media/types/TimeRange;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/xengine/media/types/TimeRange;->getBeginning()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getEffectiveRangeEnd()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/AudioTrack;->effectiveRange:Lcom/momo/xengine/media/types/TimeRange;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/xengine/media/types/TimeRange;->getEnd()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    return-wide v0
.end method

.method public getEndTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioTrack;->endTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getGain()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/AudioTrack;->gain:F

    .line 2
    .line 3
    return p0
.end method

.method public getPitch()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/AudioTrack;->pitch:I

    .line 2
    .line 3
    return p0
.end method

.method public getSpeedNodes()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/xengine/media/types/AudioSpeedNode;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/AudioTrack;->speedNodes:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioTrack;->startTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTrackID()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/AudioTrack;->trackID:I

    .line 2
    .line 3
    return p0
.end method

.method public isRepeat()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xengine/media/AudioTrack;->repeat:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAudioSource(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/AudioTrack;->audioSource:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setEffectiveRange(Lcom/momo/xengine/media/types/TimeRange;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/AudioTrack;->effectiveRange:Lcom/momo/xengine/media/types/TimeRange;

    .line 2
    .line 3
    return-void
.end method

.method public setEndTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioTrack;->endTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setGain(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/AudioTrack;->gain:F

    .line 2
    .line 3
    return-void
.end method

.method public setPitch(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/AudioTrack;->pitch:I

    .line 2
    .line 3
    return-void
.end method

.method public setRepeat(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xengine/media/AudioTrack;->repeat:Z

    .line 2
    .line 3
    return-void
.end method

.method public setStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioTrack;->startTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setTrackID(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/AudioTrack;->trackID:I

    .line 2
    .line 3
    return-void
.end method
