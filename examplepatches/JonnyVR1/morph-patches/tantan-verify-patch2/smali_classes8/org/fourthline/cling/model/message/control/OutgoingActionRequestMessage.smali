.class public Lorg/fourthline/cling/model/message/control/OutgoingActionRequestMessage;
.super Lorg/fourthline/cling/model/message/StreamRequestMessage;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/model/message/control/ActionRequestMessage;


# static fields
.field private static log:Ljava/util/logging/Logger;


# instance fields
.field private final actionNamespace:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/model/message/control/OutgoingActionRequestMessage;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lorg/fourthline/cling/model/message/control/OutgoingActionRequestMessage;->log:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/action/ActionInvocation;Ljava/net/URL;)V
    .locals 3

    .line 148
    invoke-virtual {p1}, Lorg/fourthline/cling/model/action/ActionInvocation;->getAction()Lorg/fourthline/cling/model/meta/Action;

    move-result-object v0

    new-instance v1, Lorg/fourthline/cling/model/message/UpnpRequest;

    sget-object v2, Lorg/fourthline/cling/model/message/UpnpRequest$Method;->POST:Lorg/fourthline/cling/model/message/UpnpRequest$Method;

    invoke-direct {v1, v2, p2}, Lorg/fourthline/cling/model/message/UpnpRequest;-><init>(Lorg/fourthline/cling/model/message/UpnpRequest$Method;Ljava/net/URL;)V

    invoke-direct {p0, v0, v1}, Lorg/fourthline/cling/model/message/control/OutgoingActionRequestMessage;-><init>(Lorg/fourthline/cling/model/meta/Action;Lorg/fourthline/cling/model/message/UpnpRequest;)V

    .line 149
    instance-of p2, p1, Lorg/fourthline/cling/model/action/RemoteActionInvocation;

    if-eqz p2, :cond_0

    .line 150
    check-cast p1, Lorg/fourthline/cling/model/action/RemoteActionInvocation;

    .line 151
    invoke-virtual {p1}, Lorg/fourthline/cling/model/action/RemoteActionInvocation;->getRemoteClientInfo()Lorg/fourthline/cling/model/profile/RemoteClientInfo;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 152
    invoke-virtual {p1}, Lorg/fourthline/cling/model/action/RemoteActionInvocation;->getRemoteClientInfo()Lorg/fourthline/cling/model/profile/RemoteClientInfo;

    move-result-object p2

    invoke-virtual {p2}, Lorg/fourthline/cling/model/profile/ClientInfo;->getRequestUserAgent()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 153
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    move-result-object p0

    sget-object p2, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->USER_AGENT:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    new-instance v0, Lorg/fourthline/cling/model/message/header/UserAgentHeader;

    .line 154
    invoke-virtual {p1}, Lorg/fourthline/cling/model/action/RemoteActionInvocation;->getRemoteClientInfo()Lorg/fourthline/cling/model/profile/RemoteClientInfo;

    move-result-object p1

    invoke-virtual {p1}, Lorg/fourthline/cling/model/profile/ClientInfo;->getRequestUserAgent()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/fourthline/cling/model/message/header/UserAgentHeader;-><init>(Ljava/lang/String;)V

    .line 155
    invoke-virtual {p0, p2, v0}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    return-void

    .line 156
    :cond_0
    invoke-virtual {p1}, Lorg/fourthline/cling/model/action/ActionInvocation;->getClientInfo()Lorg/fourthline/cling/model/profile/ClientInfo;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 157
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    move-result-object p0

    invoke-virtual {p1}, Lorg/fourthline/cling/model/action/ActionInvocation;->getClientInfo()Lorg/fourthline/cling/model/profile/ClientInfo;

    move-result-object p1

    invoke-virtual {p1}, Lorg/fourthline/cling/model/profile/ClientInfo;->getRequestHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/seamless/http/Headers;->putAll(Ljava/util/Map;)V

    :cond_1
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/meta/Action;Lorg/fourthline/cling/model/message/UpnpRequest;)V
    .locals 4

    .line 1
    invoke-direct {p0, p2}, Lorg/fourthline/cling/model/message/StreamRequestMessage;-><init>(Lorg/fourthline/cling/model/message/UpnpRequest;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    sget-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->CONTENT_TYPE:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 9
    .line 10
    new-instance v1, Lorg/fourthline/cling/model/message/header/ContentTypeHeader;

    .line 11
    .line 12
    sget-object v2, Lorg/fourthline/cling/model/message/header/ContentTypeHeader;->DEFAULT_CONTENT_TYPE_UTF8:Lorg/seamless/util/MimeType;

    .line 13
    .line 14
    invoke-direct {v1, v2}, Lorg/fourthline/cling/model/message/header/ContentTypeHeader;-><init>(Lorg/seamless/util/MimeType;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2, v0, v1}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 18
    .line 19
    .line 20
    instance-of p2, p1, Lorg/fourthline/cling/model/meta/QueryStateVariableAction;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    sget-object p2, Lorg/fourthline/cling/model/message/control/OutgoingActionRequestMessage;->log:Ljava/util/logging/Logger;

    .line 26
    .line 27
    const-string v1, "Adding magic control SOAP action header for state variable query action"

    .line 28
    .line 29
    invoke-virtual {p2, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance p2, Lorg/fourthline/cling/model/message/header/SoapActionHeader;

    .line 33
    .line 34
    new-instance v1, Lorg/fourthline/cling/model/types/SoapActionType;

    .line 35
    .line 36
    const-string v2, "control-1-0"

    .line 37
    .line 38
    invoke-virtual {p1}, Lorg/fourthline/cling/model/meta/Action;->getName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v3, "schemas-upnp-org"

    .line 43
    .line 44
    invoke-direct {v1, v3, v2, v0, p1}, Lorg/fourthline/cling/model/types/SoapActionType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-direct {p2, v1}, Lorg/fourthline/cling/model/message/header/SoapActionHeader;-><init>(Lorg/fourthline/cling/model/types/SoapActionType;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    new-instance p2, Lorg/fourthline/cling/model/message/header/SoapActionHeader;

    .line 52
    .line 53
    new-instance v1, Lorg/fourthline/cling/model/types/SoapActionType;

    .line 54
    .line 55
    invoke-virtual {p1}, Lorg/fourthline/cling/model/meta/Action;->getService()Lorg/fourthline/cling/model/meta/Service;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Lorg/fourthline/cling/model/meta/Service;->getServiceType()Lorg/fourthline/cling/model/types/ServiceType;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p1}, Lorg/fourthline/cling/model/meta/Action;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-direct {v1, v2, p1}, Lorg/fourthline/cling/model/types/SoapActionType;-><init>(Lorg/fourthline/cling/model/types/ServiceType;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-direct {p2, v1}, Lorg/fourthline/cling/model/message/header/SoapActionHeader;-><init>(Lorg/fourthline/cling/model/types/SoapActionType;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    invoke-virtual {p2}, Lorg/fourthline/cling/model/message/header/UpnpHeader;->getValue()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lorg/fourthline/cling/model/types/SoapActionType;

    .line 78
    .line 79
    invoke-virtual {p1}, Lorg/fourthline/cling/model/types/SoapActionType;->getTypeString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lorg/fourthline/cling/model/message/control/OutgoingActionRequestMessage;->actionNamespace:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getOperation()Lorg/fourthline/cling/model/message/UpnpOperation;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Lorg/fourthline/cling/model/message/UpnpRequest;

    .line 90
    .line 91
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/UpnpRequest;->getMethod()Lorg/fourthline/cling/model/message/UpnpRequest$Method;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    sget-object v1, Lorg/fourthline/cling/model/message/UpnpRequest$Method;->POST:Lorg/fourthline/cling/model/message/UpnpRequest$Method;

    .line 96
    .line 97
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_1

    .line 102
    .line 103
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    sget-object p1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->SOAPACTION:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 108
    .line 109
    invoke-virtual {p0, p1, p2}, Lorg/fourthline/cling/model/message/UpnpHeaders;->add(Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 110
    .line 111
    .line 112
    sget-object p0, Lorg/fourthline/cling/model/message/control/OutgoingActionRequestMessage;->log:Ljava/util/logging/Logger;

    .line 113
    .line 114
    new-instance p1, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v0, "Added SOAP action header: "

    .line 117
    .line 118
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p0, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_1
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getOperation()Lorg/fourthline/cling/model/message/UpnpOperation;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    check-cast p0, Lorg/fourthline/cling/model/message/UpnpRequest;

    .line 137
    .line 138
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpRequest;->getMethod()Lorg/fourthline/cling/model/message/UpnpRequest$Method;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const-string p1, "Can\'t send action with request method: "

    .line 143
    .line 144
    invoke-static {p1, p0}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    throw v0
.end method


# virtual methods
.method public getActionNamespace()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/message/control/OutgoingActionRequestMessage;->actionNamespace:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
