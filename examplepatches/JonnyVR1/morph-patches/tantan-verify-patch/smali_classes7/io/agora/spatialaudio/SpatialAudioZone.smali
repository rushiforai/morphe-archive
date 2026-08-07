.class public Lio/agora/spatialaudio/SpatialAudioZone;
.super Ljava/lang/Object;


# instance fields
.field public audioAttenuation:F

.field public forward:[F

.field public forwardLength:F

.field public position:[F

.field public right:[F

.field public rightLength:F

.field public up:[F

.field public upLength:F

.field public zoneSetId:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->zoneSetId:I

    const/4 v0, 0x3

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    iput-object v1, p0, Lio/agora/spatialaudio/SpatialAudioZone;->position:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_1

    iput-object v1, p0, Lio/agora/spatialaudio/SpatialAudioZone;->forward:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_2

    iput-object v1, p0, Lio/agora/spatialaudio/SpatialAudioZone;->right:[F

    new-array v0, v0, [F

    fill-array-data v0, :array_3

    iput-object v0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->up:[F

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->forwardLength:F

    iput v0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->rightLength:F

    iput v0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->upLength:F

    iput v0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->audioAttenuation:F

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public getAudioAttenuation()F
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->audioAttenuation:F

    return p0
.end method

.method public getForward()[F
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->forward:[F

    return-object p0
.end method

.method public getForwardLength()F
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->forwardLength:F

    return p0
.end method

.method public getPosition()[F
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->position:[F

    return-object p0
.end method

.method public getRight()[F
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->right:[F

    return-object p0
.end method

.method public getRightLength()F
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->rightLength:F

    return p0
.end method

.method public getUp()[F
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->up:[F

    return-object p0
.end method

.method public getUpLength()F
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->upLength:F

    return p0
.end method

.method public getZoneSetId()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/spatialaudio/SpatialAudioZone;->zoneSetId:I

    return p0
.end method
