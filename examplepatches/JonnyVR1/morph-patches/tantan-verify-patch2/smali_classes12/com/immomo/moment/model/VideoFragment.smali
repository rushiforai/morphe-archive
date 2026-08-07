.class public Lcom/immomo/moment/model/VideoFragment;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private fragmentDuration:J

.field private fragmentName:Ljava/lang/String;

.field private speed:F

.field private videoPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/immomo/moment/model/VideoFragment;->videoPath:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/immomo/moment/model/VideoFragment;->fragmentName:Ljava/lang/String;

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/immomo/moment/model/VideoFragment;->fragmentDuration:J

    .line 12
    .line 13
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    iput v0, p0, Lcom/immomo/moment/model/VideoFragment;->speed:F

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/model/VideoFragment;->fragmentDuration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFragmentName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/model/VideoFragment;->fragmentName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpeed()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/model/VideoFragment;->speed:F

    .line 2
    .line 3
    return p0
.end method

.method public getVideoPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/model/VideoFragment;->videoPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/model/VideoFragment;->fragmentDuration:J

    .line 2
    .line 3
    return-void
.end method

.method public setFragmentName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/model/VideoFragment;->fragmentName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSpeed(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/moment/model/VideoFragment;->speed:F

    .line 2
    .line 3
    return-void
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/model/VideoFragment;->videoPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
