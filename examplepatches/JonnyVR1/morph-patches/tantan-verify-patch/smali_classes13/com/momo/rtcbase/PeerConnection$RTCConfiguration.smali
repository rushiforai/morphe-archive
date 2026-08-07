.class public Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/PeerConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RTCConfiguration"
.end annotation


# instance fields
.field public activeResetSrtpParams:Z

.field public audioJitterBufferFastAccelerate:Z

.field public audioJitterBufferMaxPackets:I

.field public bundlePolicy:Lcom/momo/rtcbase/PeerConnection$BundlePolicy;

.field public candidateNetworkPolicy:Lcom/momo/rtcbase/PeerConnection$CandidateNetworkPolicy;

.field public certificate:Lcom/momo/rtcbase/RtcCertificatePem;

.field public combinedAudioVideoBwe:Ljava/lang/Boolean;

.field public continualGatheringPolicy:Lcom/momo/rtcbase/PeerConnection$ContinualGatheringPolicy;

.field public cryptoOptions:Lcom/momo/rtcbase/CryptoOptions;

.field public disableIPv6OnWifi:Z

.field public disableIpv6:Z

.field public enableCpuOveruseDetection:Z

.field public enableDscp:Z

.field public enableDtlsSrtp:Ljava/lang/Boolean;

.field public enableRtpDataChannel:Z

.field public iceBackupCandidatePairPingInterval:I

.field public iceCandidatePoolSize:I

.field public iceCheckIntervalStrongConnectivityMs:Ljava/lang/Integer;

.field public iceCheckIntervalWeakConnectivityMs:Ljava/lang/Integer;

.field public iceCheckMinInterval:Ljava/lang/Integer;

.field public iceConnectionReceivingTimeout:I

.field public iceRegatherIntervalRange:Lcom/momo/rtcbase/PeerConnection$IntervalRange;

.field public iceServers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/PeerConnection$IceServer;",
            ">;"
        }
    .end annotation
.end field

.field public iceTransportsType:Lcom/momo/rtcbase/PeerConnection$IceTransportsType;

.field public iceUnwritableMinChecks:Ljava/lang/Integer;

.field public iceUnwritableTimeMs:Ljava/lang/Integer;

.field public keyType:Lcom/momo/rtcbase/PeerConnection$KeyType;

.field public maxIPv6Networks:I

.field public networkPreference:Lcom/momo/rtcbase/PeerConnection$AdapterType;

.field public presumeWritableWhenFullyRelayed:Z

.field public pruneTurnPorts:Z

.field public rtcpMuxPolicy:Lcom/momo/rtcbase/PeerConnection$RtcpMuxPolicy;

.field public screencastMinBitrate:Ljava/lang/Integer;

.field public sdpSemantics:Lcom/momo/rtcbase/PeerConnection$SdpSemantics;

.field public stunCandidateKeepaliveIntervalMs:Ljava/lang/Integer;

.field public suspendBelowMinBitrate:Z

.field public tcpCandidatePolicy:Lcom/momo/rtcbase/PeerConnection$TcpCandidatePolicy;

.field public turnCustomizer:Lcom/momo/rtcbase/TurnCustomizer;

.field public useMediaTransport:Z

.field public useMediaTransportForDataChannels:Z


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/PeerConnection$IceServer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/momo/rtcbase/PeerConnection$IceTransportsType;->ALL:Lcom/momo/rtcbase/PeerConnection$IceTransportsType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceTransportsType:Lcom/momo/rtcbase/PeerConnection$IceTransportsType;

    .line 7
    .line 8
    sget-object v0, Lcom/momo/rtcbase/PeerConnection$BundlePolicy;->BALANCED:Lcom/momo/rtcbase/PeerConnection$BundlePolicy;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->bundlePolicy:Lcom/momo/rtcbase/PeerConnection$BundlePolicy;

    .line 11
    .line 12
    sget-object v0, Lcom/momo/rtcbase/PeerConnection$RtcpMuxPolicy;->REQUIRE:Lcom/momo/rtcbase/PeerConnection$RtcpMuxPolicy;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->rtcpMuxPolicy:Lcom/momo/rtcbase/PeerConnection$RtcpMuxPolicy;

    .line 15
    .line 16
    sget-object v0, Lcom/momo/rtcbase/PeerConnection$TcpCandidatePolicy;->ENABLED:Lcom/momo/rtcbase/PeerConnection$TcpCandidatePolicy;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->tcpCandidatePolicy:Lcom/momo/rtcbase/PeerConnection$TcpCandidatePolicy;

    .line 19
    .line 20
    sget-object v0, Lcom/momo/rtcbase/PeerConnection$CandidateNetworkPolicy;->ALL:Lcom/momo/rtcbase/PeerConnection$CandidateNetworkPolicy;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->candidateNetworkPolicy:Lcom/momo/rtcbase/PeerConnection$CandidateNetworkPolicy;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceServers:Ljava/util/List;

    .line 25
    .line 26
    const/16 p1, 0x32

    .line 27
    .line 28
    iput p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->audioJitterBufferMaxPackets:I

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->audioJitterBufferFastAccelerate:Z

    .line 32
    .line 33
    const/4 v0, -0x1

    .line 34
    iput v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceConnectionReceivingTimeout:I

    .line 35
    .line 36
    iput v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceBackupCandidatePairPingInterval:I

    .line 37
    .line 38
    sget-object v0, Lcom/momo/rtcbase/PeerConnection$KeyType;->ECDSA:Lcom/momo/rtcbase/PeerConnection$KeyType;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->keyType:Lcom/momo/rtcbase/PeerConnection$KeyType;

    .line 41
    .line 42
    sget-object v0, Lcom/momo/rtcbase/PeerConnection$ContinualGatheringPolicy;->GATHER_ONCE:Lcom/momo/rtcbase/PeerConnection$ContinualGatheringPolicy;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->continualGatheringPolicy:Lcom/momo/rtcbase/PeerConnection$ContinualGatheringPolicy;

    .line 45
    .line 46
    iput p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceCandidatePoolSize:I

    .line 47
    .line 48
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->pruneTurnPorts:Z

    .line 49
    .line 50
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->presumeWritableWhenFullyRelayed:Z

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceCheckIntervalStrongConnectivityMs:Ljava/lang/Integer;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceCheckIntervalWeakConnectivityMs:Ljava/lang/Integer;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceCheckMinInterval:Ljava/lang/Integer;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceUnwritableTimeMs:Ljava/lang/Integer;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceUnwritableMinChecks:Ljava/lang/Integer;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->stunCandidateKeepaliveIntervalMs:Ljava/lang/Integer;

    .line 64
    .line 65
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->disableIPv6OnWifi:Z

    .line 66
    .line 67
    const/4 v1, 0x5

    .line 68
    iput v1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->maxIPv6Networks:I

    .line 69
    .line 70
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceRegatherIntervalRange:Lcom/momo/rtcbase/PeerConnection$IntervalRange;

    .line 71
    .line 72
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->disableIpv6:Z

    .line 73
    .line 74
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->enableDscp:Z

    .line 75
    .line 76
    const/4 v1, 0x1

    .line 77
    iput-boolean v1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->enableCpuOveruseDetection:Z

    .line 78
    .line 79
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->enableRtpDataChannel:Z

    .line 80
    .line 81
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->suspendBelowMinBitrate:Z

    .line 82
    .line 83
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->screencastMinBitrate:Ljava/lang/Integer;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->combinedAudioVideoBwe:Ljava/lang/Boolean;

    .line 86
    .line 87
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->enableDtlsSrtp:Ljava/lang/Boolean;

    .line 88
    .line 89
    sget-object v1, Lcom/momo/rtcbase/PeerConnection$AdapterType;->UNKNOWN:Lcom/momo/rtcbase/PeerConnection$AdapterType;

    .line 90
    .line 91
    iput-object v1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->networkPreference:Lcom/momo/rtcbase/PeerConnection$AdapterType;

    .line 92
    .line 93
    sget-object v1, Lcom/momo/rtcbase/PeerConnection$SdpSemantics;->PLAN_B:Lcom/momo/rtcbase/PeerConnection$SdpSemantics;

    .line 94
    .line 95
    iput-object v1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->sdpSemantics:Lcom/momo/rtcbase/PeerConnection$SdpSemantics;

    .line 96
    .line 97
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->activeResetSrtpParams:Z

    .line 98
    .line 99
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->useMediaTransport:Z

    .line 100
    .line 101
    iput-boolean p1, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->useMediaTransportForDataChannels:Z

    .line 102
    .line 103
    iput-object v0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->cryptoOptions:Lcom/momo/rtcbase/CryptoOptions;

    .line 104
    .line 105
    return-void
.end method


# virtual methods
.method public getActiveResetSrtpParams()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->activeResetSrtpParams:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAudioJitterBufferFastAccelerate()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->audioJitterBufferFastAccelerate:Z

    .line 2
    .line 3
    return p0
.end method

.method public getAudioJitterBufferMaxPackets()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->audioJitterBufferMaxPackets:I

    .line 2
    .line 3
    return p0
.end method

.method public getBundlePolicy()Lcom/momo/rtcbase/PeerConnection$BundlePolicy;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->bundlePolicy:Lcom/momo/rtcbase/PeerConnection$BundlePolicy;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCandidateNetworkPolicy()Lcom/momo/rtcbase/PeerConnection$CandidateNetworkPolicy;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->candidateNetworkPolicy:Lcom/momo/rtcbase/PeerConnection$CandidateNetworkPolicy;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCertificate()Lcom/momo/rtcbase/RtcCertificatePem;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->certificate:Lcom/momo/rtcbase/RtcCertificatePem;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCombinedAudioVideoBwe()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->combinedAudioVideoBwe:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContinualGatheringPolicy()Lcom/momo/rtcbase/PeerConnection$ContinualGatheringPolicy;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->continualGatheringPolicy:Lcom/momo/rtcbase/PeerConnection$ContinualGatheringPolicy;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCryptoOptions()Lcom/momo/rtcbase/CryptoOptions;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->cryptoOptions:Lcom/momo/rtcbase/CryptoOptions;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDisableIPv6OnWifi()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->disableIPv6OnWifi:Z

    .line 2
    .line 3
    return p0
.end method

.method public getDisableIpv6()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->disableIpv6:Z

    .line 2
    .line 3
    return p0
.end method

.method public getEnableCpuOveruseDetection()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->enableCpuOveruseDetection:Z

    .line 2
    .line 3
    return p0
.end method

.method public getEnableDscp()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->enableDscp:Z

    .line 2
    .line 3
    return p0
.end method

.method public getEnableDtlsSrtp()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->enableDtlsSrtp:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEnableRtpDataChannel()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->enableRtpDataChannel:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIceBackupCandidatePairPingInterval()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceBackupCandidatePairPingInterval:I

    .line 2
    .line 3
    return p0
.end method

.method public getIceCandidatePoolSize()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceCandidatePoolSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getIceCheckIntervalStrongConnectivity()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceCheckIntervalStrongConnectivityMs:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIceCheckIntervalWeakConnectivity()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceCheckIntervalWeakConnectivityMs:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIceCheckMinInterval()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceCheckMinInterval:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIceConnectionReceivingTimeout()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceConnectionReceivingTimeout:I

    .line 2
    .line 3
    return p0
.end method

.method public getIceRegatherIntervalRange()Lcom/momo/rtcbase/PeerConnection$IntervalRange;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceRegatherIntervalRange:Lcom/momo/rtcbase/PeerConnection$IntervalRange;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIceServers()Ljava/util/List;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/rtcbase/PeerConnection$IceServer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceServers:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIceTransportsType()Lcom/momo/rtcbase/PeerConnection$IceTransportsType;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceTransportsType:Lcom/momo/rtcbase/PeerConnection$IceTransportsType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIceUnwritableMinChecks()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceUnwritableMinChecks:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIceUnwritableTimeout()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->iceUnwritableTimeMs:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getKeyType()Lcom/momo/rtcbase/PeerConnection$KeyType;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->keyType:Lcom/momo/rtcbase/PeerConnection$KeyType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxIPv6Networks()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->maxIPv6Networks:I

    .line 2
    .line 3
    return p0
.end method

.method public getNetworkPreference()Lcom/momo/rtcbase/PeerConnection$AdapterType;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->networkPreference:Lcom/momo/rtcbase/PeerConnection$AdapterType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPresumeWritableWhenFullyRelayed()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->presumeWritableWhenFullyRelayed:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPruneTurnPorts()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->pruneTurnPorts:Z

    .line 2
    .line 3
    return p0
.end method

.method public getRtcpMuxPolicy()Lcom/momo/rtcbase/PeerConnection$RtcpMuxPolicy;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->rtcpMuxPolicy:Lcom/momo/rtcbase/PeerConnection$RtcpMuxPolicy;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScreencastMinBitrate()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->screencastMinBitrate:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSdpSemantics()Lcom/momo/rtcbase/PeerConnection$SdpSemantics;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->sdpSemantics:Lcom/momo/rtcbase/PeerConnection$SdpSemantics;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStunCandidateKeepaliveInterval()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->stunCandidateKeepaliveIntervalMs:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuspendBelowMinBitrate()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->suspendBelowMinBitrate:Z

    .line 2
    .line 3
    return p0
.end method

.method public getTcpCandidatePolicy()Lcom/momo/rtcbase/PeerConnection$TcpCandidatePolicy;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->tcpCandidatePolicy:Lcom/momo/rtcbase/PeerConnection$TcpCandidatePolicy;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTurnCustomizer()Lcom/momo/rtcbase/TurnCustomizer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->turnCustomizer:Lcom/momo/rtcbase/TurnCustomizer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUseMediaTransport()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->useMediaTransport:Z

    .line 2
    .line 3
    return p0
.end method

.method public getUseMediaTransportForDataChannels()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "RTCConfiguration"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/PeerConnection$RTCConfiguration;->useMediaTransportForDataChannels:Z

    .line 2
    .line 3
    return p0
.end method
