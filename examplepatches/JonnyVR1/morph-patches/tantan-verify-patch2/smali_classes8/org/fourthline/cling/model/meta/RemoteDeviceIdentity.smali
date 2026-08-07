.class public Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;
.super Lorg/fourthline/cling/model/meta/DeviceIdentity;
.source "SourceFile"


# instance fields
.field private final descriptorURL:Ljava/net/URL;

.field private final discoveredOnLocalAddress:Ljava/net/InetAddress;

.field private final interfaceMacAddress:[B


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/message/discovery/IncomingNotificationRequest;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/discovery/IncomingNotificationRequest;->getUDN()Lorg/fourthline/cling/model/types/UDN;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/discovery/IncomingNotificationRequest;->getMaxAge()Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/discovery/IncomingNotificationRequest;->getLocationURL()Ljava/net/URL;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/discovery/IncomingNotificationRequest;->getInterfaceMacHeader()[B

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->getLocalAddress()Ljava/net/InetAddress;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    move-object v0, p0

    .line 22
    invoke-direct/range {v0 .. v5}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;-><init>(Lorg/fourthline/cling/model/types/UDN;Ljava/lang/Integer;Ljava/net/URL;[BLjava/net/InetAddress;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/message/discovery/IncomingSearchResponse;)V
    .locals 6

    .line 31
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/discovery/IncomingSearchResponse;->getRootDeviceUDN()Lorg/fourthline/cling/model/types/UDN;

    move-result-object v1

    .line 32
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/discovery/IncomingSearchResponse;->getMaxAge()Ljava/lang/Integer;

    move-result-object v2

    .line 33
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/discovery/IncomingSearchResponse;->getLocationURL()Ljava/net/URL;

    move-result-object v3

    .line 34
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/discovery/IncomingSearchResponse;->getInterfaceMacHeader()[B

    move-result-object v4

    .line 35
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/IncomingDatagramMessage;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v5

    move-object v0, p0

    .line 36
    invoke-direct/range {v0 .. v5}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;-><init>(Lorg/fourthline/cling/model/types/UDN;Ljava/lang/Integer;Ljava/net/URL;[BLjava/net/InetAddress;)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/types/UDN;Ljava/lang/Integer;Ljava/net/URL;[BLjava/net/InetAddress;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Lorg/fourthline/cling/model/meta/DeviceIdentity;-><init>(Lorg/fourthline/cling/model/types/UDN;Ljava/lang/Integer;)V

    .line 27
    iput-object p3, p0, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->descriptorURL:Ljava/net/URL;

    .line 28
    iput-object p4, p0, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->interfaceMacAddress:[B

    .line 29
    iput-object p5, p0, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->discoveredOnLocalAddress:Ljava/net/InetAddress;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/types/UDN;Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;)V
    .locals 6

    .line 30
    invoke-virtual {p2}, Lorg/fourthline/cling/model/meta/DeviceIdentity;->getMaxAgeSeconds()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->getDescriptorURL()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {p2}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->getInterfaceMacAddress()[B

    move-result-object v4

    invoke-virtual {p2}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->getDiscoveredOnLocalAddress()Ljava/net/InetAddress;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;-><init>(Lorg/fourthline/cling/model/types/UDN;Ljava/lang/Integer;Ljava/net/URL;[BLjava/net/InetAddress;)V

    return-void
.end method


# virtual methods
.method public getDescriptorURL()Ljava/net/URL;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->descriptorURL:Ljava/net/URL;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDiscoveredOnLocalAddress()Ljava/net/InetAddress;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->discoveredOnLocalAddress:Ljava/net/InetAddress;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInterfaceMacAddress()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->interfaceMacAddress:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getWakeOnLANBytes()[B
    .locals 6

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->getInterfaceMacAddress()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->getInterfaceMacAddress()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    array-length v0, v0

    .line 14
    mul-int/lit8 v0, v0, 0x10

    .line 15
    .line 16
    const/4 v1, 0x6

    .line 17
    add-int/2addr v0, v1

    .line 18
    new-array v2, v0, [B

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    move v4, v3

    .line 22
    :goto_0
    if-ge v4, v1, :cond_1

    .line 23
    .line 24
    const/4 v5, -0x1

    .line 25
    aput-byte v5, v2, v4

    .line 26
    .line 27
    add-int/lit8 v4, v4, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    :goto_1
    if-ge v1, v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->getInterfaceMacAddress()[B

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->getInterfaceMacAddress()[B

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    array-length v5, v5

    .line 41
    invoke-static {v4, v3, v2, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->getInterfaceMacAddress()[B

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    array-length v4, v4

    .line 49
    add-int/2addr v1, v4

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    sget-boolean v0, Lorg/fourthline/cling/model/ModelUtil;->ANDROID_RUNTIME:Z

    .line 2
    .line 3
    const-string v1, ", Descriptor: "

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "(RemoteDeviceIdentity) UDN: "

    .line 10
    .line 11
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/DeviceIdentity;->getUdn()Lorg/fourthline/cling/model/types/UDN;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->getDescriptorURL()Ljava/net/URL;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v2, "("

    .line 39
    .line 40
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v2, ") UDN: "

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/DeviceIdentity;->getUdn()Lorg/fourthline/cling/model/types/UDN;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;->getDescriptorURL()Ljava/net/URL;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method
