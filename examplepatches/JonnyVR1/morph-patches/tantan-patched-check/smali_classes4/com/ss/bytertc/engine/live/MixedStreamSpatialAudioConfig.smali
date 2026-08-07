.class public Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

.field public audienceSpatialPosition:Lcom/ss/bytertc/engine/data/Position;

.field public enableSpatialRender:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->enableSpatialRender:Z

    .line 6
    .line 7
    new-instance v0, Lcom/ss/bytertc/engine/data/Position;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/ss/bytertc/engine/data/Position;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialPosition:Lcom/ss/bytertc/engine/data/Position;

    .line 13
    .line 14
    new-instance v0, Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/ss/bytertc/engine/data/HumanOrientation;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialOrientation:Lcom/ss/bytertc/engine/data/HumanOrientation;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public setAudienceSpatialPosition(FFF)Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSpatialAudioConfig;->audienceSpatialPosition:Lcom/ss/bytertc/engine/data/Position;

    .line 2
    .line 3
    iput p1, v0, Lcom/ss/bytertc/engine/data/Position;->x:F

    .line 4
    .line 5
    iput p2, v0, Lcom/ss/bytertc/engine/data/Position;->y:F

    .line 6
    .line 7
    iput p3, v0, Lcom/ss/bytertc/engine/data/Position;->z:F

    .line 8
    .line 9
    return-object p0
.end method
