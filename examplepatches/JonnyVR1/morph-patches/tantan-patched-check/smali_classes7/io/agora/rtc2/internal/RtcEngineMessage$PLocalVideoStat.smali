.class public Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PLocalVideoStat"
.end annotation


# instance fields
.field public source:I

.field public stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    new-instance v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-direct {v0}, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    return-void
.end method


# virtual methods
.method public marshall()[B
    .locals 1

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->source:I

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushByte(B)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->uid:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->sentBitrate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->sentFrameRate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->captureFrameRate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->regulatedCaptureFrameRate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->captureFrameWidth:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->captureFrameHeight:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->regulatedCaptureFrameWidth:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->regulatedCaptureFrameHeight:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encoderOutputFrameRate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->rendererOutputFrameRate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->targetBitrate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->targetFrameRate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encodedBitrate:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encodedFrameWidth:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encodedFrameHeight:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encodedFrameCount:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->codecType:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->qualityAdaptIndication:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->txPacketLossRate:I

    int-to-short v0, v0

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->captureBrightnessLevel:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget-boolean v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->dualStreamEnabled:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushBool(Ljava/lang/Boolean;)V

    iget-object v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    iget v0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->hwEncoderAccelerating:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method

.method public unmarshall([B)V
    .locals 1

    invoke-super {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->unmarshall([B)V

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popByte()B

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->source:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->uid:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->sentBitrate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->sentFrameRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->captureFrameRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->regulatedCaptureFrameRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->captureFrameWidth:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->captureFrameHeight:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->regulatedCaptureFrameWidth:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->regulatedCaptureFrameHeight:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encoderOutputFrameRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->rendererOutputFrameRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->targetBitrate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->targetFrameRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encodedBitrate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encodedFrameWidth:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encodedFrameHeight:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->encodedFrameCount:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->codecType:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->qualityAdaptIndication:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->txPacketLossRate:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result v0

    iput v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->captureBrightnessLevel:I

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popBool()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->dualStreamEnabled:Z

    iget-object p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PLocalVideoStat;->stats:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p0

    iput p0, p1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->hwEncoderAccelerating:I

    return-void
.end method
