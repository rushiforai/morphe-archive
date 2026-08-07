.class public Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioMixedTrackConfiguration;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PLocalAudioMixedTrackConfiguration"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method

.method private marshall(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/LocalAudioMixerConfiguration;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lio/agora/rtc2/LocalAudioMixerConfiguration;->audioInputStreams:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-boolean v0, p2, Lio/agora/rtc2/LocalAudioMixerConfiguration;->syncWithLocalMic:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/agora/rtc2/internal/Marshallable;->pushBool(Ljava/lang/Boolean;)V

    iget-object p2, p2, Lio/agora/rtc2/LocalAudioMixerConfiguration;->audioInputStreams:Ljava/util/ArrayList;

    invoke-direct {p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioMixedTrackConfiguration;->marshallMixedAudioStream(Lio/agora/rtc2/internal/Marshallable;Ljava/util/ArrayList;)V

    return-void
.end method

.method private marshallLocalAudioMixedStream(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;)V
    .locals 0

    iget-object p0, p2, Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;->sourceType:Lio/agora/rtc2/Constants$AudioSourceType;

    invoke-static {p0}, Lio/agora/rtc2/Constants$AudioSourceType;->getValue(Lio/agora/rtc2/Constants$AudioSourceType;)I

    move-result p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;->remoteUserUid:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;->channelId:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushString16(Ljava/lang/String;)V

    iget p0, p2, Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;->trackId:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    return-void
.end method

.method private marshallMixedAudioStream(Lio/agora/rtc2/internal/Marshallable;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/agora/rtc2/internal/Marshallable;",
            "Ljava/util/ArrayList<",
            "Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;

    invoke-direct {p0, p1, v0}, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioMixedTrackConfiguration;->marshallLocalAudioMixedStream(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/LocalAudioMixerConfiguration$MixedAudioStream;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public marshall(Lio/agora/rtc2/LocalAudioMixerConfiguration;)[B
    .locals 0

    .line 2
    invoke-direct {p0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioMixedTrackConfiguration;->marshall(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/LocalAudioMixerConfiguration;)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method
