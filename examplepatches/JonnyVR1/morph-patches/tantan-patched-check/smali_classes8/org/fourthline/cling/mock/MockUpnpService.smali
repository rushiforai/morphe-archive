.class public Lorg/fourthline/cling/mock/MockUpnpService;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/UpnpService;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;
    }
.end annotation

.annotation runtime Ljavax/enterprise/inject/Alternative;
.end annotation


# instance fields
.field protected final configuration:Lorg/fourthline/cling/UpnpServiceConfiguration;

.field protected final controlPoint:Lorg/fourthline/cling/controlpoint/ControlPoint;

.field protected final networkAddressFactory:Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;

.field protected final protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

.field protected final registry:Lorg/fourthline/cling/registry/Registry;

.field protected final router:Lorg/fourthline/cling/mock/MockRouter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 42
    new-instance v0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;-><init>(ZZ)V

    invoke-direct {p0, v1, v0}, Lorg/fourthline/cling/mock/MockUpnpService;-><init>(ZLorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, v0, p1}, Lorg/fourthline/cling/mock/MockUpnpService;-><init>(ZLorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V

    return-void
.end method

.method public constructor <init>(ZLorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lorg/fourthline/cling/mock/MockUpnpService;->configuration:Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 5
    .line 6
    invoke-virtual {p0, p0, p1}, Lorg/fourthline/cling/mock/MockUpnpService;->createProtocolFactory(Lorg/fourthline/cling/UpnpService;Z)Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lorg/fourthline/cling/mock/MockUpnpService;->protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 11
    .line 12
    new-instance v0, Lorg/fourthline/cling/mock/MockUpnpService$1;

    .line 13
    .line 14
    invoke-direct {v0, p0, p0, p2}, Lorg/fourthline/cling/mock/MockUpnpService$1;-><init>(Lorg/fourthline/cling/mock/MockUpnpService;Lorg/fourthline/cling/UpnpService;Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lorg/fourthline/cling/mock/MockUpnpService;->registry:Lorg/fourthline/cling/registry/Registry;

    .line 18
    .line 19
    invoke-interface {p2}, Lorg/fourthline/cling/UpnpServiceConfiguration;->createNetworkAddressFactory()Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, p0, Lorg/fourthline/cling/mock/MockUpnpService;->networkAddressFactory:Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;

    .line 24
    .line 25
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpService;->createRouter()Lorg/fourthline/cling/mock/MockRouter;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, p0, Lorg/fourthline/cling/mock/MockUpnpService;->router:Lorg/fourthline/cling/mock/MockRouter;

    .line 30
    .line 31
    new-instance v1, Lorg/fourthline/cling/controlpoint/ControlPointImpl;

    .line 32
    .line 33
    invoke-direct {v1, p2, p1, v0}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;-><init>(Lorg/fourthline/cling/UpnpServiceConfiguration;Lorg/fourthline/cling/protocol/ProtocolFactory;Lorg/fourthline/cling/registry/Registry;)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lorg/fourthline/cling/mock/MockUpnpService;->controlPoint:Lorg/fourthline/cling/controlpoint/ControlPoint;

    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 2

    .line 40
    new-instance v0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;-><init>(ZZ)V

    invoke-direct {p0, p1, v0}, Lorg/fourthline/cling/mock/MockUpnpService;-><init>(ZLorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V

    return-void
.end method

.method public constructor <init>(ZZZ)V
    .locals 1

    .line 41
    new-instance v0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;

    invoke-direct {v0, p2, p3}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;-><init>(ZZ)V

    invoke-direct {p0, p1, v0}, Lorg/fourthline/cling/mock/MockUpnpService;-><init>(ZLorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V

    return-void
.end method


# virtual methods
.method public createProtocolFactory(Lorg/fourthline/cling/UpnpService;Z)Lorg/fourthline/cling/protocol/ProtocolFactory;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;-><init>(Lorg/fourthline/cling/UpnpService;Z)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createRouter()Lorg/fourthline/cling/mock/MockRouter;
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/mock/MockRouter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpService;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpService;->getProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, v1, p0}, Lorg/fourthline/cling/mock/MockRouter;-><init>(Lorg/fourthline/cling/UpnpServiceConfiguration;Lorg/fourthline/cling/protocol/ProtocolFactory;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/mock/MockUpnpService;->configuration:Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 2
    .line 3
    return-object p0
.end method

.method public getControlPoint()Lorg/fourthline/cling/controlpoint/ControlPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/mock/MockUpnpService;->controlPoint:Lorg/fourthline/cling/controlpoint/ControlPoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/mock/MockUpnpService;->protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRegistry()Lorg/fourthline/cling/registry/Registry;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/mock/MockUpnpService;->registry:Lorg/fourthline/cling/registry/Registry;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRouter()Lorg/fourthline/cling/mock/MockRouter;
    .locals 0

    .line 6
    iget-object p0, p0, Lorg/fourthline/cling/mock/MockUpnpService;->router:Lorg/fourthline/cling/mock/MockRouter;

    return-object p0
.end method

.method public bridge synthetic getRouter()Lorg/fourthline/cling/transport/Router;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpService;->getRouter()Lorg/fourthline/cling/mock/MockRouter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public shutdown()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpService;->getRegistry()Lorg/fourthline/cling/registry/Registry;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lorg/fourthline/cling/registry/Registry;->shutdown()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpService;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Lorg/fourthline/cling/UpnpServiceConfiguration;->shutdown()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
