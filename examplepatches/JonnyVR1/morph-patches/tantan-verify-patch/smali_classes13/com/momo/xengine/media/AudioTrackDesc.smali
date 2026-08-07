.class public Lcom/momo/xengine/media/AudioTrackDesc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private duration:J

.field private fade_in:J

.field private fade_out:J

.field private offset:J

.field private path:Ljava/lang/String;

.field private speed:F

.field private speedNodes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private start_time:J

.field private track_duration:J

.field private track_end_time:J

.field private track_index:I

.field private track_time:J

.field private volumedB:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->start_time:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->duration:J

    .line 9
    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    iput v2, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speed:F

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput v2, p0, Lcom/momo/xengine/media/AudioTrackDesc;->volumedB:I

    .line 16
    .line 17
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->fade_in:J

    .line 18
    .line 19
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->fade_out:J

    .line 20
    .line 21
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_duration:J

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->offset:J

    .line 24
    .line 25
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_time:J

    .line 26
    .line 27
    iput-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_end_time:J

    .line 28
    .line 29
    iput v2, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_index:I

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-object v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speedNodes:Ljava/util/Map;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->duration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFade_in()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->fade_in:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFade_out()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->fade_out:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getOffset()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->offset:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpeed()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speed:F

    .line 2
    .line 3
    return p0
.end method

.method public getSpeedNodes()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speedNodes:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpeedNodesFloatArray()[F
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speedNodes:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speedNodes:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    rem-int/lit8 v0, v0, 0x2

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speedNodes:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    mul-int/lit8 v0, v0, 0x2

    .line 28
    .line 29
    new-array v0, v0, [F

    .line 30
    .line 31
    iget-object v1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speedNodes:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const/4 v2, 0x0

    .line 42
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Ljava/lang/Float;

    .line 53
    .line 54
    mul-int/lit8 v4, v2, 0x2

    .line 55
    .line 56
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    aput v5, v0, v4

    .line 61
    .line 62
    add-int/lit8 v4, v4, 0x1

    .line 63
    .line 64
    iget-object v5, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speedNodes:Ljava/util/Map;

    .line 65
    .line 66
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    check-cast v3, Ljava/lang/Float;

    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    aput v3, v0, v4

    .line 77
    .line 78
    add-int/lit8 v2, v2, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    return-object v0

    .line 82
    :cond_1
    const/4 p0, 0x0

    .line 83
    return-object p0
.end method

.method public getStart_time()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->start_time:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTrack_duration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_duration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTrack_end_time()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_end_time:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTrack_index()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_index:I

    .line 2
    .line 3
    return p0
.end method

.method public getTrack_time()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_time:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getVolumedB()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/AudioTrackDesc;->volumedB:I

    .line 2
    .line 3
    return p0
.end method

.method public setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->duration:J

    .line 2
    .line 3
    return-void
.end method

.method public setFade_in(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->fade_in:J

    .line 2
    .line 3
    return-void
.end method

.method public setFade_out(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->fade_out:J

    .line 2
    .line 3
    return-void
.end method

.method public setOffset(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->offset:J

    .line 2
    .line 3
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSpeed(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speed:F

    .line 2
    .line 3
    return-void
.end method

.method public setSpeedNodes(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->speedNodes:Ljava/util/Map;

    .line 2
    .line 3
    return-void
.end method

.method public setStart_time(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->start_time:J

    .line 2
    .line 3
    return-void
.end method

.method public setTrack_duration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_duration:J

    .line 2
    .line 3
    return-void
.end method

.method public setTrack_end_time(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_end_time:J

    .line 2
    .line 3
    return-void
.end method

.method public setTrack_index(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_index:I

    .line 2
    .line 3
    return-void
.end method

.method public setTrack_time(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->track_time:J

    .line 2
    .line 3
    return-void
.end method

.method public setVolumedB(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/AudioTrackDesc;->volumedB:I

    .line 2
    .line 3
    return-void
.end method
