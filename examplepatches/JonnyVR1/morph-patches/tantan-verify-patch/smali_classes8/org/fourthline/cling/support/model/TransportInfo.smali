.class public Lorg/fourthline/cling/support/model/TransportInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private currentSpeed:Ljava/lang/String;

.field private currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

.field private currentTransportStatus:Lorg/fourthline/cling/support/model/TransportStatus;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    sget-object v0, Lorg/fourthline/cling/support/model/TransportState;->NO_MEDIA_PRESENT:Lorg/fourthline/cling/support/model/TransportState;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

    .line 57
    sget-object v0, Lorg/fourthline/cling/support/model/TransportStatus;->OK:Lorg/fourthline/cling/support/model/TransportStatus;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportStatus:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 58
    const-string v0, "1"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentSpeed:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/fourthline/cling/model/action/ActionArgumentValue;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "CurrentTransportState"

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
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Lorg/fourthline/cling/support/model/TransportState;->valueOrCustomOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/TransportState;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "CurrentTransportStatus"

    .line 20
    .line 21
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 26
    .line 27
    invoke-virtual {v1}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1}, Lorg/fourthline/cling/support/model/TransportStatus;->valueOrCustomOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/TransportStatus;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "CurrentSpeed"

    .line 38
    .line 39
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 44
    .line 45
    invoke-virtual {p1}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {p0, v0, v1, p1}, Lorg/fourthline/cling/support/model/TransportInfo;-><init>(Lorg/fourthline/cling/support/model/TransportState;Lorg/fourthline/cling/support/model/TransportStatus;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/TransportState;)V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    sget-object v0, Lorg/fourthline/cling/support/model/TransportState;->NO_MEDIA_PRESENT:Lorg/fourthline/cling/support/model/TransportState;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

    .line 61
    sget-object v0, Lorg/fourthline/cling/support/model/TransportStatus;->OK:Lorg/fourthline/cling/support/model/TransportStatus;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportStatus:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 62
    const-string v0, "1"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentSpeed:Ljava/lang/String;

    .line 63
    iput-object p1, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/TransportState;Ljava/lang/String;)V
    .locals 1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    sget-object v0, Lorg/fourthline/cling/support/model/TransportState;->NO_MEDIA_PRESENT:Lorg/fourthline/cling/support/model/TransportState;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

    .line 66
    sget-object v0, Lorg/fourthline/cling/support/model/TransportStatus;->OK:Lorg/fourthline/cling/support/model/TransportStatus;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportStatus:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 67
    iput-object p1, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

    .line 68
    iput-object p2, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentSpeed:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/TransportState;Lorg/fourthline/cling/support/model/TransportStatus;)V
    .locals 1

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    sget-object v0, Lorg/fourthline/cling/support/model/TransportState;->NO_MEDIA_PRESENT:Lorg/fourthline/cling/support/model/TransportState;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

    .line 71
    sget-object v0, Lorg/fourthline/cling/support/model/TransportStatus;->OK:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 72
    const-string v0, "1"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentSpeed:Ljava/lang/String;

    .line 73
    iput-object p1, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

    .line 74
    iput-object p2, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportStatus:Lorg/fourthline/cling/support/model/TransportStatus;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/TransportState;Lorg/fourthline/cling/support/model/TransportStatus;Ljava/lang/String;)V
    .locals 1

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    sget-object v0, Lorg/fourthline/cling/support/model/TransportState;->NO_MEDIA_PRESENT:Lorg/fourthline/cling/support/model/TransportState;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

    .line 77
    sget-object v0, Lorg/fourthline/cling/support/model/TransportStatus;->OK:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 78
    iput-object p1, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

    .line 79
    iput-object p2, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportStatus:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 80
    iput-object p3, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentSpeed:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCurrentSpeed()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentSpeed:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentTransportState()Lorg/fourthline/cling/support/model/TransportState;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportState:Lorg/fourthline/cling/support/model/TransportState;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentTransportStatus()Lorg/fourthline/cling/support/model/TransportStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/TransportInfo;->currentTransportStatus:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 2
    .line 3
    return-object p0
.end method
