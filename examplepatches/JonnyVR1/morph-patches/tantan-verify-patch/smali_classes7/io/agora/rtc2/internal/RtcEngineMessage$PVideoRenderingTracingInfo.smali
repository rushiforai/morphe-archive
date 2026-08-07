.class public Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PVideoRenderingTracingInfo"
.end annotation


# instance fields
.field public elapsedTime:I

.field public event:S

.field public join2JoinSuccess:I

.field public joinSuccess2RemoteJoined:I

.field public remoteJoined2PacketReceived:I

.field public remoteJoined2SetView:I

.field public remoteJoined2UnmuteVideo:I

.field public start2JoinChannel:I

.field public uid:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method


# virtual methods
.method public getVideoRenderingTracingInfo()Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;
    .locals 2

    new-instance v0, Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;

    invoke-direct {v0}, Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;-><init>()V

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->elapsedTime:I

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;->elapsedTime:I

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->start2JoinChannel:I

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;->start2JoinChannel:I

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->join2JoinSuccess:I

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;->join2JoinSuccess:I

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->joinSuccess2RemoteJoined:I

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;->joinSuccess2RemoteJoined:I

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->remoteJoined2SetView:I

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;->remoteJoined2SetView:I

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->remoteJoined2UnmuteVideo:I

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;->remoteJoined2UnmuteVideo:I

    iget p0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->remoteJoined2PacketReceived:I

    iput p0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$VideoRenderingTracingInfo;->remoteJoined2PacketReceived:I

    return-object v0
.end method

.method public marshall()[B
    .locals 1

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->uid:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-short v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->event:S

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->elapsedTime:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->start2JoinChannel:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->join2JoinSuccess:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->joinSuccess2RemoteJoined:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->remoteJoined2SetView:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->remoteJoined2UnmuteVideo:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->remoteJoined2PacketReceived:I

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method

.method public unmarshall([B)V
    .locals 0

    invoke-super {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->unmarshall([B)V

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->uid:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result p1

    iput-short p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->event:S

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->elapsedTime:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->start2JoinChannel:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->join2JoinSuccess:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->joinSuccess2RemoteJoined:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->remoteJoined2SetView:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->remoteJoined2UnmuteVideo:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PVideoRenderingTracingInfo;->remoteJoined2PacketReceived:I

    return-void
.end method
