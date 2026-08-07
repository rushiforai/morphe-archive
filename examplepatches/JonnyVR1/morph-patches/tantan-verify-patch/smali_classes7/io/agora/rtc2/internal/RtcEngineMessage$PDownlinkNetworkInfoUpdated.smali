.class public Lio/agora/rtc2/internal/RtcEngineMessage$PDownlinkNetworkInfoUpdated;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PDownlinkNetworkInfoUpdated"
.end annotation


# instance fields
.field bandwidth_estimation_bps:I

.field lastmile_buffer_delay_time_ms:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method


# virtual methods
.method public getDownlinkNetworkInfo()Lio/agora/rtc2/IRtcEngineEventHandler$DownlinkNetworkInfo;
    .locals 2

    new-instance v0, Lio/agora/rtc2/IRtcEngineEventHandler$DownlinkNetworkInfo;

    invoke-direct {v0}, Lio/agora/rtc2/IRtcEngineEventHandler$DownlinkNetworkInfo;-><init>()V

    iget v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PDownlinkNetworkInfoUpdated;->lastmile_buffer_delay_time_ms:I

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$DownlinkNetworkInfo;->lastmile_buffer_delay_time_ms:I

    iget p0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PDownlinkNetworkInfoUpdated;->bandwidth_estimation_bps:I

    iput p0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$DownlinkNetworkInfo;->bandwidth_estimation_bps:I

    return-object v0
.end method

.method public marshall()[B
    .locals 0

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method

.method public unmarshall([B)V
    .locals 0

    invoke-super {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->unmarshall([B)V

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PDownlinkNetworkInfoUpdated;->lastmile_buffer_delay_time_ms:I

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popInt()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PDownlinkNetworkInfoUpdated;->bandwidth_estimation_bps:I

    return-void
.end method
