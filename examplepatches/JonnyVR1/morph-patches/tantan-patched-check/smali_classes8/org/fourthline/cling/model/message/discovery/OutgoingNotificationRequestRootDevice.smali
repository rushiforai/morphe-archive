.class public Lorg/fourthline/cling/model/message/discovery/OutgoingNotificationRequestRootDevice;
.super Lorg/fourthline/cling/model/message/discovery/OutgoingNotificationRequest;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/Location;Lorg/fourthline/cling/model/meta/LocalDevice;Lorg/fourthline/cling/model/types/NotificationSubtype;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lorg/fourthline/cling/model/message/discovery/OutgoingNotificationRequest;-><init>(Lorg/fourthline/cling/model/Location;Lorg/fourthline/cling/model/meta/LocalDevice;Lorg/fourthline/cling/model/types/NotificationSubtype;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/OutgoingDatagramMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    sget-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->NT:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 9
    .line 10
    new-instance v1, Lorg/fourthline/cling/model/message/header/RootDeviceHeader;

    .line 11
    .line 12
    invoke-direct {v1}, Lorg/fourthline/cling/model/message/header/RootDeviceHeader;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3, v0, v1}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/OutgoingDatagramMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    sget-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->USN:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 23
    .line 24
    new-instance v1, Lorg/fourthline/cling/model/message/header/USNRootDeviceHeader;

    .line 25
    .line 26
    invoke-virtual {p2}, Lorg/fourthline/cling/model/meta/Device;->getIdentity()Lorg/fourthline/cling/model/meta/DeviceIdentity;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p2}, Lorg/fourthline/cling/model/meta/DeviceIdentity;->getUdn()Lorg/fourthline/cling/model/types/UDN;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-direct {v1, p2}, Lorg/fourthline/cling/model/message/header/USNRootDeviceHeader;-><init>(Lorg/fourthline/cling/model/types/UDN;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p3, v0, v1}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 38
    .line 39
    .line 40
    const-string p2, "org.fourthline.cling.network.announceMACAddress"

    .line 41
    .line 42
    invoke-static {p2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    const-string p3, "true"

    .line 47
    .line 48
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_0

    .line 53
    .line 54
    invoke-virtual {p1}, Lorg/fourthline/cling/model/Location;->getNetworkAddress()Lorg/fourthline/cling/model/NetworkAddress;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p2}, Lorg/fourthline/cling/model/NetworkAddress;->getHardwareAddress()[B

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    if-eqz p2, :cond_0

    .line 63
    .line 64
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/OutgoingDatagramMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    sget-object p2, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->EXT_IFACE_MAC:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 69
    .line 70
    new-instance p3, Lorg/fourthline/cling/model/message/header/InterfaceMacHeader;

    .line 71
    .line 72
    invoke-virtual {p1}, Lorg/fourthline/cling/model/Location;->getNetworkAddress()Lorg/fourthline/cling/model/NetworkAddress;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Lorg/fourthline/cling/model/NetworkAddress;->getHardwareAddress()[B

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-direct {p3, p1}, Lorg/fourthline/cling/model/message/header/InterfaceMacHeader;-><init>([B)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p2, p3}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 84
    .line 85
    .line 86
    :cond_0
    return-void
.end method
