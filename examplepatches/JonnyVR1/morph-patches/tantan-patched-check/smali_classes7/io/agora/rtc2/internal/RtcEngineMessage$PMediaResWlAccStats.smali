.class public Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PMediaResWlAccStats"
.end annotation


# instance fields
.field public e2eDelayPercentAve:S

.field public e2eDelayPercentCur:S

.field public frozenRatioPercentAve:S

.field public frozenRatioPercentCur:S

.field public lossRatePercentAve:S

.field public lossRatePercentCur:S


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method


# virtual methods
.method public getWlAccStatsAve()Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;
    .locals 2

    new-instance v0, Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;

    invoke-direct {v0}, Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;-><init>()V

    iget-short v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->e2eDelayPercentAve:S

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;->e2eDelayPercent:I

    iget-short v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->frozenRatioPercentAve:S

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;->frozenRatioPercent:I

    iget-short p0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->lossRatePercentAve:S

    iput p0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;->lossRatePercent:I

    return-object v0
.end method

.method public getWlAccStatsCur()Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;
    .locals 2

    new-instance v0, Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;

    invoke-direct {v0}, Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;-><init>()V

    iget-short v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->e2eDelayPercentCur:S

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;->e2eDelayPercent:I

    iget-short v1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->frozenRatioPercentCur:S

    iput v1, v0, Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;->frozenRatioPercent:I

    iget-short p0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->lossRatePercentCur:S

    iput p0, v0, Lio/agora/rtc2/IRtcEngineEventHandler$WlAccStats;->lossRatePercent:I

    return-object v0
.end method

.method public marshall()[B
    .locals 1

    iget-short v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->e2eDelayPercentCur:S

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget-short v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->frozenRatioPercentCur:S

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget-short v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->lossRatePercentCur:S

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget-short v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->e2eDelayPercentAve:S

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget-short v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->frozenRatioPercentAve:S

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget-short v0, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->lossRatePercentAve:S

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method

.method public unmarshall([B)V
    .locals 0

    invoke-super {p0, p1}, Lio/agora/rtc2/internal/Marshallable;->unmarshall([B)V

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result p1

    iput-short p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->e2eDelayPercentCur:S

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result p1

    iput-short p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->frozenRatioPercentCur:S

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result p1

    iput-short p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->lossRatePercentCur:S

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result p1

    iput-short p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->e2eDelayPercentAve:S

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result p1

    iput-short p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->frozenRatioPercentAve:S

    invoke-virtual {p0}, Lio/agora/rtc2/internal/Marshallable;->popShort()S

    move-result p1

    iput-short p1, p0, Lio/agora/rtc2/internal/RtcEngineMessage$PMediaResWlAccStats;->lossRatePercentAve:S

    return-void
.end method
