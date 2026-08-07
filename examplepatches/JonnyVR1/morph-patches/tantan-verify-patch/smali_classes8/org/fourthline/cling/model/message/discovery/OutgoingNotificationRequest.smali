.class public abstract Lorg/fourthline/cling/model/message/discovery/OutgoingNotificationRequest;
.super Lorg/fourthline/cling/model/message/OutgoingDatagramMessage;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/fourthline/cling/model/message/OutgoingDatagramMessage<",
        "Lorg/fourthline/cling/model/message/UpnpRequest;",
        ">;"
    }
.end annotation


# instance fields
.field private type:Lorg/fourthline/cling/model/types/NotificationSubtype;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/Location;Lorg/fourthline/cling/model/meta/LocalDevice;Lorg/fourthline/cling/model/types/NotificationSubtype;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/fourthline/cling/model/message/UpnpRequest;

    .line 2
    .line 3
    sget-object v1, Lorg/fourthline/cling/model/message/UpnpRequest$Method;->NOTIFY:Lorg/fourthline/cling/model/message/UpnpRequest$Method;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/fourthline/cling/model/message/UpnpRequest;-><init>(Lorg/fourthline/cling/model/message/UpnpRequest$Method;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "239.255.255.250"

    .line 9
    .line 10
    invoke-static {v1}, Lorg/fourthline/cling/model/ModelUtil;->getInetAddressByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/16 v2, 0x76c

    .line 15
    .line 16
    invoke-direct {p0, v0, v1, v2}, Lorg/fourthline/cling/model/message/OutgoingDatagramMessage;-><init>(Lorg/fourthline/cling/model/message/UpnpOperation;Ljava/net/InetAddress;I)V

    .line 17
    .line 18
    .line 19
    iput-object p3, p0, Lorg/fourthline/cling/model/message/discovery/OutgoingNotificationRequest;->type:Lorg/fourthline/cling/model/types/NotificationSubtype;

    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/OutgoingDatagramMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->MAX_AGE:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 26
    .line 27
    new-instance v2, Lorg/fourthline/cling/model/message/header/MaxAgeHeader;

    .line 28
    .line 29
    invoke-virtual {p2}, Lorg/fourthline/cling/model/meta/Device;->getIdentity()Lorg/fourthline/cling/model/meta/DeviceIdentity;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Lorg/fourthline/cling/model/meta/DeviceIdentity;->getMaxAgeSeconds()Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-direct {v2, p2}, Lorg/fourthline/cling/model/message/header/MaxAgeHeader;-><init>(Ljava/lang/Integer;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/OutgoingDatagramMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    sget-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->LOCATION:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 48
    .line 49
    new-instance v1, Lorg/fourthline/cling/model/message/header/LocationHeader;

    .line 50
    .line 51
    invoke-virtual {p1}, Lorg/fourthline/cling/model/Location;->getURL()Ljava/net/URL;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-direct {v1, p1}, Lorg/fourthline/cling/model/message/header/LocationHeader;-><init>(Ljava/net/URL;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, v0, v1}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/OutgoingDatagramMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    sget-object p2, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->SERVER:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 66
    .line 67
    new-instance v0, Lorg/fourthline/cling/model/message/header/ServerHeader;

    .line 68
    .line 69
    invoke-direct {v0}, Lorg/fourthline/cling/model/message/header/ServerHeader;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, p2, v0}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/OutgoingDatagramMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    sget-object p2, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->HOST:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 80
    .line 81
    new-instance v0, Lorg/fourthline/cling/model/message/header/HostHeader;

    .line 82
    .line 83
    invoke-direct {v0}, Lorg/fourthline/cling/model/message/header/HostHeader;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, p2, v0}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/OutgoingDatagramMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    sget-object p1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->NTS:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 94
    .line 95
    new-instance p2, Lorg/fourthline/cling/model/message/header/NTSHeader;

    .line 96
    .line 97
    invoke-direct {p2, p3}, Lorg/fourthline/cling/model/message/header/NTSHeader;-><init>(Lorg/fourthline/cling/model/types/NotificationSubtype;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, p1, p2}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method


# virtual methods
.method public getType()Lorg/fourthline/cling/model/types/NotificationSubtype;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/message/discovery/OutgoingNotificationRequest;->type:Lorg/fourthline/cling/model/types/NotificationSubtype;

    .line 2
    .line 3
    return-object p0
.end method
