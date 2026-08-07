.class public Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PLocalAudioStat"
.end annotation


# instance fields
.field public stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    new-instance v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    invoke-direct {v0}, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    return-void
.end method


# virtual methods
.method public marshall()[B
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->numChannels:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->sentSampleRate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->sentBitrate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->internalCodec:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->txPacketLossRate:I

    int-to-short v0, v0

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->audioDeviceDelay:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->audioPlayoutDelay:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->earMonitorDelay:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->aecEstimatedDelay:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method

.method public unmarshall([B)V
    .locals 1

    invoke-super {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->unmarshall([B)V

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->numChannels:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->sentSampleRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->sentBitrate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->internalCodec:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->txPacketLossRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->audioDeviceDelay:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->audioPlayoutDelay:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->earMonitorDelay:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p0

    iput p0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;->aecEstimatedDelay:I

    return-void
.end method
