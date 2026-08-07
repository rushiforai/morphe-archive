.class public Lio/agora/rtc2/SpatialAudioParams;
.super Ljava/lang/Object;


# instance fields
.field public enable_air_absorb:Ljava/lang/Boolean;

.field public enable_blur:Ljava/lang/Boolean;

.field public enable_doppler:Ljava/lang/Boolean;

.field public speaker_attenuation:Ljava/lang/Double;

.field public speaker_azimuth:Ljava/lang/Double;

.field public speaker_distance:Ljava/lang/Double;

.field public speaker_elevation:Ljava/lang/Double;

.field public speaker_orientation:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAirAbsorbFlag()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/SpatialAudioParams;->enable_air_absorb:Ljava/lang/Boolean;

    return-object p0
.end method

.method public getBlurFlag()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/SpatialAudioParams;->enable_blur:Ljava/lang/Boolean;

    return-object p0
.end method

.method public getDopplerFlag()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/SpatialAudioParams;->enable_doppler:Ljava/lang/Boolean;

    return-object p0
.end method

.method public getSpeakerAttenuation()Ljava/lang/Double;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/SpatialAudioParams;->speaker_attenuation:Ljava/lang/Double;

    return-object p0
.end method

.method public getSpeakerAzimuth()Ljava/lang/Double;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/SpatialAudioParams;->speaker_azimuth:Ljava/lang/Double;

    return-object p0
.end method

.method public getSpeakerDistance()Ljava/lang/Double;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/SpatialAudioParams;->speaker_distance:Ljava/lang/Double;

    return-object p0
.end method

.method public getSpeakerElevation()Ljava/lang/Double;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/SpatialAudioParams;->speaker_elevation:Ljava/lang/Double;

    return-object p0
.end method

.method public getSpeakerOrientation()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/SpatialAudioParams;->speaker_orientation:Ljava/lang/Integer;

    return-object p0
.end method
