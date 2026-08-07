.class public Lio/agora/spatialaudio/RemoteVoicePositionInfo;
.super Ljava/lang/Object;


# instance fields
.field public forward:[F

.field public position:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    iput-object v1, p0, Lio/agora/spatialaudio/RemoteVoicePositionInfo;->position:[F

    new-array v0, v0, [F

    fill-array-data v0, :array_1

    iput-object v0, p0, Lio/agora/spatialaudio/RemoteVoicePositionInfo;->forward:[F

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
.end method


# virtual methods
.method public getForward()[F
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/spatialaudio/RemoteVoicePositionInfo;->forward:[F

    return-object p0
.end method

.method public getPosition()[F
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/spatialaudio/RemoteVoicePositionInfo;->position:[F

    return-object p0
.end method
