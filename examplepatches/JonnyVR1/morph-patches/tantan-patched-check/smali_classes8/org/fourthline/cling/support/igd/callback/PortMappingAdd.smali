.class public abstract Lorg/fourthline/cling/support/igd/callback/PortMappingAdd;
.super Lorg/fourthline/cling/controlpoint/ActionCallback;
.source "SourceFile"


# instance fields
.field protected final portMapping:Lorg/fourthline/cling/support/model/PortMapping;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/support/model/PortMapping;)V
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 2
    .line 3
    const-string v1, "AddPortMapping"

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Lorg/fourthline/cling/model/meta/Service;->getAction(Ljava/lang/String;)Lorg/fourthline/cling/model/meta/Action;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {v0, p1}, Lorg/fourthline/cling/model/action/ActionInvocation;-><init>(Lorg/fourthline/cling/model/meta/Action;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0, p2}, Lorg/fourthline/cling/controlpoint/ActionCallback;-><init>(Lorg/fourthline/cling/model/action/ActionInvocation;Lorg/fourthline/cling/controlpoint/ControlPoint;)V

    .line 13
    .line 14
    .line 15
    iput-object p3, p0, Lorg/fourthline/cling/support/igd/callback/PortMappingAdd;->portMapping:Lorg/fourthline/cling/support/model/PortMapping;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ActionCallback;->getActionInvocation()Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string p2, "NewExternalPort"

    .line 22
    .line 23
    invoke-virtual {p3}, Lorg/fourthline/cling/support/model/PortMapping;->getExternalPort()Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, p2, v0}, Lorg/fourthline/cling/model/action/ActionInvocation;->setInput(Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ActionCallback;->getActionInvocation()Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p2, "NewProtocol"

    .line 35
    .line 36
    invoke-virtual {p3}, Lorg/fourthline/cling/support/model/PortMapping;->getProtocol()Lorg/fourthline/cling/support/model/PortMapping$Protocol;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, p2, v0}, Lorg/fourthline/cling/model/action/ActionInvocation;->setInput(Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ActionCallback;->getActionInvocation()Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "NewInternalClient"

    .line 48
    .line 49
    invoke-virtual {p3}, Lorg/fourthline/cling/support/model/PortMapping;->getInternalClient()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, p2, v0}, Lorg/fourthline/cling/model/action/ActionInvocation;->setInput(Ljava/lang/String;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ActionCallback;->getActionInvocation()Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const-string p2, "NewInternalPort"

    .line 61
    .line 62
    invoke-virtual {p3}, Lorg/fourthline/cling/support/model/PortMapping;->getInternalPort()Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p1, p2, v0}, Lorg/fourthline/cling/model/action/ActionInvocation;->setInput(Ljava/lang/String;Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ActionCallback;->getActionInvocation()Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-string p2, "NewLeaseDuration"

    .line 74
    .line 75
    invoke-virtual {p3}, Lorg/fourthline/cling/support/model/PortMapping;->getLeaseDurationSeconds()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p1, p2, v0}, Lorg/fourthline/cling/model/action/ActionInvocation;->setInput(Ljava/lang/String;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ActionCallback;->getActionInvocation()Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p3}, Lorg/fourthline/cling/support/model/PortMapping;->isEnabled()Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    const-string v0, "NewEnabled"

    .line 95
    .line 96
    invoke-virtual {p1, v0, p2}, Lorg/fourthline/cling/model/action/ActionInvocation;->setInput(Ljava/lang/String;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p3}, Lorg/fourthline/cling/support/model/PortMapping;->hasRemoteHost()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_0

    .line 104
    .line 105
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ActionCallback;->getActionInvocation()Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    const-string p2, "NewRemoteHost"

    .line 110
    .line 111
    invoke-virtual {p3}, Lorg/fourthline/cling/support/model/PortMapping;->getRemoteHost()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p1, p2, v0}, Lorg/fourthline/cling/model/action/ActionInvocation;->setInput(Ljava/lang/String;Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    :cond_0
    invoke-virtual {p3}, Lorg/fourthline/cling/support/model/PortMapping;->hasDescription()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_1

    .line 123
    .line 124
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ActionCallback;->getActionInvocation()Lorg/fourthline/cling/model/action/ActionInvocation;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const-string p1, "NewPortMappingDescription"

    .line 129
    .line 130
    invoke-virtual {p3}, Lorg/fourthline/cling/support/model/PortMapping;->getDescription()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-virtual {p0, p1, p2}, Lorg/fourthline/cling/model/action/ActionInvocation;->setInput(Ljava/lang/String;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    :cond_1
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/support/model/PortMapping;)V
    .locals 1

    const/4 v0, 0x0

    .line 138
    invoke-direct {p0, p1, v0, p2}, Lorg/fourthline/cling/support/igd/callback/PortMappingAdd;-><init>(Lorg/fourthline/cling/model/meta/Service;Lorg/fourthline/cling/controlpoint/ControlPoint;Lorg/fourthline/cling/support/model/PortMapping;)V

    return-void
.end method
