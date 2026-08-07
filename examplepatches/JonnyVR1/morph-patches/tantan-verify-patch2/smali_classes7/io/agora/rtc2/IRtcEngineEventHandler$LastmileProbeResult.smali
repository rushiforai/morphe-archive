.class public Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/IRtcEngineEventHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LastmileProbeResult"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult$LastmileProbeOneWayResult;
    }
.end annotation


# instance fields
.field public downlinkReport:Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult$LastmileProbeOneWayResult;

.field public rtt:I

.field public state:S

.field public uplinkReport:Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult$LastmileProbeOneWayResult;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult$LastmileProbeOneWayResult;

    invoke-direct {v0}, Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult$LastmileProbeOneWayResult;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult;->uplinkReport:Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult$LastmileProbeOneWayResult;

    new-instance v0, Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult$LastmileProbeOneWayResult;

    invoke-direct {v0}, Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult$LastmileProbeOneWayResult;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult;->downlinkReport:Lio/agora/rtc2/IRtcEngineEventHandler$LastmileProbeResult$LastmileProbeOneWayResult;

    return-void
.end method
