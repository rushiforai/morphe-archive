.class public Lorg/fourthline/cling/support/model/PortMapping;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/support/model/PortMapping$Protocol;
    }
.end annotation


# instance fields
.field private description:Ljava/lang/String;

.field private enabled:Z

.field private externalPort:Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

.field private internalClient:Ljava/lang/String;

.field private internalPort:Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

.field private leaseDurationSeconds:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

.field private protocol:Lorg/fourthline/cling/support/model/PortMapping$Protocol;

.field private remoteHost:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Lorg/fourthline/cling/support/model/PortMapping$Protocol;)V
    .locals 9

    .line 131
    new-instance v2, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v0, 0x0

    invoke-direct {v2, v0, v1}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    new-instance v4, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    int-to-long v0, p1

    invoke-direct {v4, v0, v1}, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;-><init>(J)V

    new-instance v5, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    invoke-direct {v5, v0, v1}, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;-><init>(J)V

    const/4 v8, 0x0

    const/4 v1, 0x1

    const/4 v3, 0x0

    move-object v0, p0

    move-object v6, p2

    move-object v7, p3

    invoke-direct/range {v0 .. v8}, Lorg/fourthline/cling/support/model/PortMapping;-><init>(ZLorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Ljava/lang/String;Lorg/fourthline/cling/support/model/PortMapping$Protocol;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Lorg/fourthline/cling/support/model/PortMapping$Protocol;Ljava/lang/String;)V
    .locals 9

    .line 132
    new-instance v2, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v0, 0x0

    invoke-direct {v2, v0, v1}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    new-instance v4, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    int-to-long v0, p1

    invoke-direct {v4, v0, v1}, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;-><init>(J)V

    new-instance v5, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    invoke-direct {v5, v0, v1}, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;-><init>(J)V

    const/4 v1, 0x1

    const/4 v3, 0x0

    move-object v0, p0

    move-object v6, p2

    move-object v7, p3

    move-object v8, p4

    invoke-direct/range {v0 .. v8}, Lorg/fourthline/cling/support/model/PortMapping;-><init>(ZLorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Ljava/lang/String;Lorg/fourthline/cling/support/model/PortMapping$Protocol;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Lorg/fourthline/cling/support/model/PortMapping$Protocol;)V
    .locals 9

    .line 133
    new-instance v2, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v0, 0x0

    invoke-direct {v2, v0, v1}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v1, 0x1

    const/4 v5, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v7, p3

    invoke-direct/range {v0 .. v8}, Lorg/fourthline/cling/support/model/PortMapping;-><init>(ZLorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Ljava/lang/String;Lorg/fourthline/cling/support/model/PortMapping$Protocol;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/fourthline/cling/model/action/ActionArgumentValue<",
            "Lorg/fourthline/cling/model/meta/Service;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "NewEnabled"

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const-string v0, "NewLeaseDuration"

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 26
    .line 27
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    move-object v3, v0

    .line 32
    check-cast v3, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 33
    .line 34
    const-string v0, "NewRemoteHost"

    .line 35
    .line 36
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 41
    .line 42
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    move-object v4, v0

    .line 47
    check-cast v4, Ljava/lang/String;

    .line 48
    .line 49
    const-string v0, "NewExternalPort"

    .line 50
    .line 51
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 56
    .line 57
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    move-object v5, v0

    .line 62
    check-cast v5, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 63
    .line 64
    const-string v0, "NewInternalPort"

    .line 65
    .line 66
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 71
    .line 72
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    move-object v6, v0

    .line 77
    check-cast v6, Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 78
    .line 79
    const-string v0, "NewInternalClient"

    .line 80
    .line 81
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 86
    .line 87
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    move-object v7, v0

    .line 92
    check-cast v7, Ljava/lang/String;

    .line 93
    .line 94
    const-string v0, "NewProtocol"

    .line 95
    .line 96
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 101
    .line 102
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v0}, Lorg/fourthline/cling/support/model/PortMapping$Protocol;->valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/PortMapping$Protocol;

    .line 107
    .line 108
    .line 109
    move-result-object v8

    .line 110
    const-string v0, "NewPortMappingDescription"

    .line 111
    .line 112
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    check-cast p1, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 117
    .line 118
    invoke-virtual {p1}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    move-object v9, p1

    .line 123
    check-cast v9, Ljava/lang/String;

    .line 124
    .line 125
    move-object v1, p0

    .line 126
    invoke-direct/range {v1 .. v9}, Lorg/fourthline/cling/support/model/PortMapping;-><init>(ZLorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Ljava/lang/String;Lorg/fourthline/cling/support/model/PortMapping$Protocol;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public constructor <init>(ZLorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;Ljava/lang/String;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;Ljava/lang/String;Lorg/fourthline/cling/support/model/PortMapping$Protocol;Ljava/lang/String;)V
    .locals 0

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    iput-boolean p1, p0, Lorg/fourthline/cling/support/model/PortMapping;->enabled:Z

    .line 136
    iput-object p2, p0, Lorg/fourthline/cling/support/model/PortMapping;->leaseDurationSeconds:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 137
    iput-object p3, p0, Lorg/fourthline/cling/support/model/PortMapping;->remoteHost:Ljava/lang/String;

    .line 138
    iput-object p4, p0, Lorg/fourthline/cling/support/model/PortMapping;->externalPort:Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 139
    iput-object p5, p0, Lorg/fourthline/cling/support/model/PortMapping;->internalPort:Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 140
    iput-object p6, p0, Lorg/fourthline/cling/support/model/PortMapping;->internalClient:Ljava/lang/String;

    .line 141
    iput-object p7, p0, Lorg/fourthline/cling/support/model/PortMapping;->protocol:Lorg/fourthline/cling/support/model/PortMapping$Protocol;

    .line 142
    iput-object p8, p0, Lorg/fourthline/cling/support/model/PortMapping;->description:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PortMapping;->description:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "-"

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getExternalPort()Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PortMapping;->externalPort:Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInternalClient()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PortMapping;->internalClient:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInternalPort()Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PortMapping;->internalPort:Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeaseDurationSeconds()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PortMapping;->leaseDurationSeconds:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtocol()Lorg/fourthline/cling/support/model/PortMapping$Protocol;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PortMapping;->protocol:Lorg/fourthline/cling/support/model/PortMapping$Protocol;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRemoteHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PortMapping;->remoteHost:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "-"

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public hasDescription()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PortMapping;->description:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public hasRemoteHost()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PortMapping;->remoteHost:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/fourthline/cling/support/model/PortMapping;->enabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "-"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    :cond_1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/PortMapping;->description:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public setEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/fourthline/cling/support/model/PortMapping;->enabled:Z

    .line 2
    .line 3
    return-void
.end method

.method public setExternalPort(Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/PortMapping;->externalPort:Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 2
    .line 3
    return-void
.end method

.method public setInternalClient(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/PortMapping;->internalClient:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setInternalPort(Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/PortMapping;->internalPort:Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 2
    .line 3
    return-void
.end method

.method public setLeaseDurationSeconds(Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/PortMapping;->leaseDurationSeconds:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    return-void
.end method

.method public setProtocol(Lorg/fourthline/cling/support/model/PortMapping$Protocol;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/PortMapping;->protocol:Lorg/fourthline/cling/support/model/PortMapping$Protocol;

    .line 2
    .line 3
    return-void
.end method

.method public setRemoteHost(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "-"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    :cond_1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/PortMapping;->remoteHost:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ") Protocol: "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PortMapping;->getProtocol()Lorg/fourthline/cling/support/model/PortMapping$Protocol;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ", "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PortMapping;->getExternalPort()Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, " => "

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PortMapping;->getInternalClient()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method
