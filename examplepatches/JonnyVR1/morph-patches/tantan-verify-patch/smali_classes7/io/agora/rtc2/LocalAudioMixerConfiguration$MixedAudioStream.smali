.class public Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/LocalAudioMixerConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MixedAudioStream"
.end annotation


# instance fields
.field public channelId:Ljava/lang/String;

.field public remoteUserUid:I

.field public sourceType:Lio/agora/rtc2/Constants$AudioSourceType;

.field public trackId:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lio/agora/rtc2/Constants$AudioSourceType;->AUDIO_SOURCE_UNKNOWN:Lio/agora/rtc2/Constants$AudioSourceType;

    iput-object v0, p0, Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;->sourceType:Lio/agora/rtc2/Constants$AudioSourceType;

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;->remoteUserUid:I

    const-string v1, ""

    iput-object v1, p0, Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;->channelId:Ljava/lang/String;

    iput v0, p0, Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;->trackId:I

    return-void
.end method
