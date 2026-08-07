.class public abstract Lorg/fourthline/cling/support/avtransport/impl/state/NoMediaPresent;
.super Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/fourthline/cling/support/model/AVTransport;",
        ">",
        "Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final log:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/avtransport/impl/state/Stopped;

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
    sput-object v0, Lorg/fourthline/cling/support/avtransport/impl/state/NoMediaPresent;->log:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/AVTransport;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;-><init>(Lorg/fourthline/cling/support/model/AVTransport;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getCurrentTransportActions()[Lorg/fourthline/cling/support/model/TransportAction;
    .locals 0

    .line 1
    sget-object p0, Lorg/fourthline/cling/support/model/TransportAction;->Stop:Lorg/fourthline/cling/support/model/TransportAction;

    .line 2
    .line 3
    filled-new-array {p0}, [Lorg/fourthline/cling/support/model/TransportAction;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onEntry()V
    .locals 5

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/avtransport/impl/state/NoMediaPresent;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    const-string v1, "Setting transport state to NO_MEDIA_PRESENT"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;->getTransport()Lorg/fourthline/cling/support/model/AVTransport;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lorg/fourthline/cling/support/model/TransportInfo;

    .line 13
    .line 14
    sget-object v2, Lorg/fourthline/cling/support/model/TransportState;->NO_MEDIA_PRESENT:Lorg/fourthline/cling/support/model/TransportState;

    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;->getTransport()Lorg/fourthline/cling/support/model/AVTransport;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/AVTransport;->getTransportInfo()Lorg/fourthline/cling/support/model/TransportInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/TransportInfo;->getCurrentTransportStatus()Lorg/fourthline/cling/support/model/TransportStatus;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {p0}, Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;->getTransport()Lorg/fourthline/cling/support/model/AVTransport;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v4}, Lorg/fourthline/cling/support/model/AVTransport;->getTransportInfo()Lorg/fourthline/cling/support/model/TransportInfo;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4}, Lorg/fourthline/cling/support/model/TransportInfo;->getCurrentSpeed()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-direct {v1, v2, v3, v4}, Lorg/fourthline/cling/support/model/TransportInfo;-><init>(Lorg/fourthline/cling/support/model/TransportState;Lorg/fourthline/cling/support/model/TransportStatus;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lorg/fourthline/cling/support/model/AVTransport;->setTransportInfo(Lorg/fourthline/cling/support/model/TransportInfo;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;->getTransport()Lorg/fourthline/cling/support/model/AVTransport;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lorg/fourthline/cling/support/model/AVTransport;->getLastChange()Lorg/fourthline/cling/support/lastchange/LastChange;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0}, Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;->getTransport()Lorg/fourthline/cling/support/model/AVTransport;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lorg/fourthline/cling/support/model/AVTransport;->getInstanceId()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v3, Lorg/fourthline/cling/support/avtransport/lastchange/AVTransportVariable$TransportState;

    .line 63
    .line 64
    invoke-direct {v3, v2}, Lorg/fourthline/cling/support/avtransport/lastchange/AVTransportVariable$TransportState;-><init>(Lorg/fourthline/cling/support/model/TransportState;)V

    .line 65
    .line 66
    .line 67
    new-instance v2, Lorg/fourthline/cling/support/avtransport/lastchange/AVTransportVariable$CurrentTransportActions;

    .line 68
    .line 69
    invoke-virtual {p0}, Lorg/fourthline/cling/support/avtransport/impl/state/NoMediaPresent;->getCurrentTransportActions()[Lorg/fourthline/cling/support/model/TransportAction;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-direct {v2, p0}, Lorg/fourthline/cling/support/avtransport/lastchange/AVTransportVariable$CurrentTransportActions;-><init>([Lorg/fourthline/cling/support/model/TransportAction;)V

    .line 74
    .line 75
    .line 76
    const/4 p0, 0x2

    .line 77
    new-array p0, p0, [Lorg/fourthline/cling/support/lastchange/EventedValue;

    .line 78
    .line 79
    const/4 v4, 0x0

    .line 80
    aput-object v3, p0, v4

    .line 81
    .line 82
    const/4 v3, 0x1

    .line 83
    aput-object v2, p0, v3

    .line 84
    .line 85
    invoke-virtual {v0, v1, p0}, Lorg/fourthline/cling/support/lastchange/LastChange;->setEventedValue(Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;[Lorg/fourthline/cling/support/lastchange/EventedValue;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public abstract setTransportURI(Ljava/net/URI;Ljava/lang/String;)Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "+",
            "Lorg/fourthline/cling/support/avtransport/impl/state/AbstractState;",
            ">;"
        }
    .end annotation
.end method
