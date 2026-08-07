.class public Lorg/fourthline/cling/support/model/AVTransport;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected deviceCapabilities:Lorg/fourthline/cling/support/model/DeviceCapabilities;

.field protected final instanceID:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

.field protected final lastChange:Lorg/fourthline/cling/support/lastchange/LastChange;

.field protected mediaInfo:Lorg/fourthline/cling/support/model/MediaInfo;

.field protected positionInfo:Lorg/fourthline/cling/support/model/PositionInfo;

.field protected transportInfo:Lorg/fourthline/cling/support/model/TransportInfo;

.field protected transportSettings:Lorg/fourthline/cling/support/model/TransportSettings;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Lorg/fourthline/cling/support/lastchange/LastChange;Lorg/fourthline/cling/support/model/StorageMedium;)V
    .locals 0

    .line 49
    filled-new-array {p3}, [Lorg/fourthline/cling/support/model/StorageMedium;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lorg/fourthline/cling/support/model/AVTransport;-><init>(Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Lorg/fourthline/cling/support/lastchange/LastChange;[Lorg/fourthline/cling/support/model/StorageMedium;)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Lorg/fourthline/cling/support/lastchange/LastChange;[Lorg/fourthline/cling/support/model/StorageMedium;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/support/model/AVTransport;->instanceID:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/support/model/AVTransport;->lastChange:Lorg/fourthline/cling/support/lastchange/LastChange;

    .line 7
    .line 8
    new-instance p1, Lorg/fourthline/cling/support/model/DeviceCapabilities;

    .line 9
    .line 10
    invoke-direct {p1, p3}, Lorg/fourthline/cling/support/model/DeviceCapabilities;-><init>([Lorg/fourthline/cling/support/model/StorageMedium;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/model/AVTransport;->setDeviceCapabilities(Lorg/fourthline/cling/support/model/DeviceCapabilities;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Lorg/fourthline/cling/support/model/MediaInfo;

    .line 17
    .line 18
    invoke-direct {p1}, Lorg/fourthline/cling/support/model/MediaInfo;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/model/AVTransport;->setMediaInfo(Lorg/fourthline/cling/support/model/MediaInfo;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Lorg/fourthline/cling/support/model/TransportInfo;

    .line 25
    .line 26
    invoke-direct {p1}, Lorg/fourthline/cling/support/model/TransportInfo;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/model/AVTransport;->setTransportInfo(Lorg/fourthline/cling/support/model/TransportInfo;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Lorg/fourthline/cling/support/model/PositionInfo;

    .line 33
    .line 34
    invoke-direct {p1}, Lorg/fourthline/cling/support/model/PositionInfo;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/model/AVTransport;->setPositionInfo(Lorg/fourthline/cling/support/model/PositionInfo;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Lorg/fourthline/cling/support/model/TransportSettings;

    .line 41
    .line 42
    invoke-direct {p1}, Lorg/fourthline/cling/support/model/TransportSettings;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/model/AVTransport;->setTransportSettings(Lorg/fourthline/cling/support/model/TransportSettings;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public getDeviceCapabilities()Lorg/fourthline/cling/support/model/DeviceCapabilities;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/AVTransport;->deviceCapabilities:Lorg/fourthline/cling/support/model/DeviceCapabilities;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInstanceId()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/AVTransport;->instanceID:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLastChange()Lorg/fourthline/cling/support/lastchange/LastChange;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/AVTransport;->lastChange:Lorg/fourthline/cling/support/lastchange/LastChange;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaInfo()Lorg/fourthline/cling/support/model/MediaInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/AVTransport;->mediaInfo:Lorg/fourthline/cling/support/model/MediaInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPositionInfo()Lorg/fourthline/cling/support/model/PositionInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/AVTransport;->positionInfo:Lorg/fourthline/cling/support/model/PositionInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransportInfo()Lorg/fourthline/cling/support/model/TransportInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/AVTransport;->transportInfo:Lorg/fourthline/cling/support/model/TransportInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransportSettings()Lorg/fourthline/cling/support/model/TransportSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/AVTransport;->transportSettings:Lorg/fourthline/cling/support/model/TransportSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDeviceCapabilities(Lorg/fourthline/cling/support/model/DeviceCapabilities;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/AVTransport;->deviceCapabilities:Lorg/fourthline/cling/support/model/DeviceCapabilities;

    .line 2
    .line 3
    return-void
.end method

.method public setMediaInfo(Lorg/fourthline/cling/support/model/MediaInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/AVTransport;->mediaInfo:Lorg/fourthline/cling/support/model/MediaInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setPositionInfo(Lorg/fourthline/cling/support/model/PositionInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/AVTransport;->positionInfo:Lorg/fourthline/cling/support/model/PositionInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setTransportInfo(Lorg/fourthline/cling/support/model/TransportInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/AVTransport;->transportInfo:Lorg/fourthline/cling/support/model/TransportInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setTransportSettings(Lorg/fourthline/cling/support/model/TransportSettings;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/AVTransport;->transportSettings:Lorg/fourthline/cling/support/model/TransportSettings;

    .line 2
    .line 3
    return-void
.end method
