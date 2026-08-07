.class public Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PRemoteAudioStat"
.end annotation


# instance fields
.field public stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    new-instance v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-direct {v0}, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    return-void
.end method


# virtual methods
.method public marshall()[B
    .locals 2

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->uid:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->quality:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->networkTransportDelay:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->jitterBufferDelay:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->audioLossRate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->numChannels:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->receivedSampleRate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->receivedBitrate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->totalFrozenTime:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->frozenRate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget-wide v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->totalActiveTime:J

    invoke-virtual {p0, v0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushInt64(J)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget-wide v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->publishDuration:J

    invoke-virtual {p0, v0, v1}, Lio/agora/rtc2/internal/Marshallable;->pushInt64(J)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->qoeQuality:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->qualityChangedReason:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->mosValue:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->frozenRateByCustomPlcCount:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->plcCount:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->frozenCntByCustom:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->frozenTimeByCustom:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->rxAudioBytes:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->e2eDelay:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method

.method public unmarshall([B)V
    .locals 2

    invoke-super {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->unmarshall([B)V

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->uid:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->quality:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->networkTransportDelay:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->jitterBufferDelay:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->audioLossRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->numChannels:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->receivedSampleRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->receivedBitrate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->totalFrozenTime:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->frozenRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt64()J

    move-result-wide v0

    iput-wide v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->totalActiveTime:J

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt64()J

    move-result-wide v0

    iput-wide v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->publishDuration:J

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->qoeQuality:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->qualityChangedReason:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->mosValue:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->frozenRateByCustomPlcCount:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->plcCount:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->frozenCntByCustom:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->frozenTimeByCustom:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->rxAudioBytes:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PRemoteAudioStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p0

    iput p0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;->e2eDelay:I

    return-void
.end method
