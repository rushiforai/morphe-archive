.class public Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/UpnpServiceConfiguration;


# annotations
.annotation runtime Ljavax/enterprise/context/ApplicationScoped;
.end annotation


# static fields
.field private static log:Ljava/util/logging/Logger;


# instance fields
.field protected datagramProcessor:Lorg/fourthline/cling/transport/spi/DatagramProcessor;

.field private defaultExecutorService:Ljava/util/concurrent/ExecutorService;

.field private deviceDescriptorBinderUDA10:Lorg/fourthline/cling/binding/xml/DeviceDescriptorBinder;

.field private genaEventProcessor:Lorg/fourthline/cling/transport/spi/GENAEventProcessor;

.field private namespace:Lorg/fourthline/cling/model/Namespace;

.field private serviceDescriptorBinderUDA10:Lorg/fourthline/cling/binding/xml/ServiceDescriptorBinder;

.field private soapActionProcessor:Lorg/fourthline/cling/transport/spi/SOAPActionProcessor;

.field private streamListenPort:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;

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
    sput-object v0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->log:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createDatagramIO(Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;)Lorg/fourthline/cling/transport/spi/DatagramIO;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/transport/impl/DatagramIOImpl;

    .line 2
    .line 3
    new-instance p1, Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;

    .line 4
    .line 5
    invoke-direct {p1}, Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1}, Lorg/fourthline/cling/transport/impl/DatagramIOImpl;-><init>(Lorg/fourthline/cling/transport/impl/DatagramIOConfigurationImpl;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public createDefaultExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration$ClingExecutor;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration$ClingExecutor;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createDeviceDescriptorBinderUDA10()Lorg/fourthline/cling/binding/xml/DeviceDescriptorBinder;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/binding/xml/UDA10DeviceDescriptorBinderImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/binding/xml/UDA10DeviceDescriptorBinderImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createGENAEventProcessor()Lorg/fourthline/cling/transport/spi/GENAEventProcessor;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/transport/impl/GENAEventProcessorImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/transport/impl/GENAEventProcessorImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createMulticastReceiver(Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;)Lorg/fourthline/cling/transport/spi/MulticastReceiver;
    .locals 2

    .line 1
    new-instance p0, Lorg/fourthline/cling/transport/impl/MulticastReceiverImpl;

    .line 2
    .line 3
    new-instance v0, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;

    .line 4
    .line 5
    invoke-interface {p1}, Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;->getMulticastGroup()Ljava/net/InetAddress;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {p1}, Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;->getMulticastPort()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-direct {v0, v1, p1}, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;-><init>(Ljava/net/InetAddress;I)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, v0}, Lorg/fourthline/cling/transport/impl/MulticastReceiverImpl;-><init>(Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public createNamespace()Lorg/fourthline/cling/model/Namespace;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/model/Namespace;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/model/Namespace;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createNetworkAddressFactory()Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;
    .locals 1

    .line 1
    iget v0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->streamListenPort:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->createNetworkAddressFactory(I)Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public createNetworkAddressFactory(I)Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;
    .locals 0

    .line 8
    new-instance p0, Lorg/fourthline/cling/transport/impl/NetworkAddressFactoryImpl;

    invoke-direct {p0, p1}, Lorg/fourthline/cling/transport/impl/NetworkAddressFactoryImpl;-><init>(I)V

    return-object p0
.end method

.method public createSOAPActionProcessor()Lorg/fourthline/cling/transport/spi/SOAPActionProcessor;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/transport/impl/SOAPActionProcessorImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/transport/impl/SOAPActionProcessorImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createServiceDescriptorBinderUDA10()Lorg/fourthline/cling/binding/xml/ServiceDescriptorBinder;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/binding/xml/UDA10ServiceDescriptorBinderImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/binding/xml/UDA10ServiceDescriptorBinderImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createStreamClient()Lorg/fourthline/cling/transport/spi/StreamClient;
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/transport/impl/StreamClientImpl;

    .line 2
    .line 3
    new-instance v1, Lorg/fourthline/cling/transport/impl/StreamClientConfigurationImpl;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->getSyncProtocolExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v1, p0}, Lorg/fourthline/cling/transport/impl/StreamClientConfigurationImpl;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Lorg/fourthline/cling/transport/impl/StreamClientImpl;-><init>(Lorg/fourthline/cling/transport/impl/StreamClientConfigurationImpl;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public createStreamServer(Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;)Lorg/fourthline/cling/transport/spi/StreamServer;
    .locals 1

    .line 1
    new-instance p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl;

    .line 2
    .line 3
    new-instance v0, Lorg/fourthline/cling/transport/impl/StreamServerConfigurationImpl;

    .line 4
    .line 5
    invoke-interface {p1}, Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;->getStreamListenPort()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-direct {v0, p1}, Lorg/fourthline/cling/transport/impl/StreamServerConfigurationImpl;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lorg/fourthline/cling/transport/impl/StreamServerImpl;-><init>(Lorg/fourthline/cling/transport/impl/StreamServerConfigurationImpl;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public getAliveIntervalMillis()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getAsyncProtocolExecutor()Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDatagramIOExecutor()Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDatagramProcessor()Lorg/fourthline/cling/transport/spi/DatagramProcessor;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->datagramProcessor:Lorg/fourthline/cling/transport/spi/DatagramProcessor;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->defaultExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDescriptorRetrievalHeaders(Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;)Lorg/fourthline/cling/model/message/UpnpHeaders;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getDeviceDescriptorBinderUDA10()Lorg/fourthline/cling/binding/xml/DeviceDescriptorBinder;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->deviceDescriptorBinderUDA10:Lorg/fourthline/cling/binding/xml/DeviceDescriptorBinder;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEventSubscriptionHeaders(Lorg/fourthline/cling/model/meta/RemoteService;)Lorg/fourthline/cling/model/message/UpnpHeaders;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getExclusiveServiceTypes()[Lorg/fourthline/cling/model/types/ServiceType;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Lorg/fourthline/cling/model/types/ServiceType;

    .line 3
    .line 4
    return-object p0
.end method

.method public getGenaEventProcessor()Lorg/fourthline/cling/transport/spi/GENAEventProcessor;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->genaEventProcessor:Lorg/fourthline/cling/transport/spi/GENAEventProcessor;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMulticastReceiverExecutor()Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getNamespace()Lorg/fourthline/cling/model/Namespace;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->namespace:Lorg/fourthline/cling/model/Namespace;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRegistryListenerExecutor()Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getRegistryMaintainerExecutor()Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getRegistryMaintenanceIntervalMillis()I
    .locals 0

    const/16 p0, 0x3e8

    return p0
.end method

.method public getRemoteDeviceMaxAgeSeconds()Ljava/lang/Integer;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getServiceDescriptorBinderUDA10()Lorg/fourthline/cling/binding/xml/ServiceDescriptorBinder;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->serviceDescriptorBinderUDA10:Lorg/fourthline/cling/binding/xml/ServiceDescriptorBinder;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSoapActionProcessor()Lorg/fourthline/cling/transport/spi/SOAPActionProcessor;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->soapActionProcessor:Lorg/fourthline/cling/transport/spi/SOAPActionProcessor;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStreamServerExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getSyncProtocolExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public init()V
    .locals 1
    .annotation runtime Ljavax/annotation/PostConstruct;
    .end annotation

    .line 1
    sget-boolean v0, Lorg/fourthline/cling/model/ModelUtil;->ANDROID_RUNTIME:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->streamListenPort:I

    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->createDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->defaultExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 13
    .line 14
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->createSOAPActionProcessor()Lorg/fourthline/cling/transport/spi/SOAPActionProcessor;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->soapActionProcessor:Lorg/fourthline/cling/transport/spi/SOAPActionProcessor;

    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->createGENAEventProcessor()Lorg/fourthline/cling/transport/spi/GENAEventProcessor;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->genaEventProcessor:Lorg/fourthline/cling/transport/spi/GENAEventProcessor;

    .line 25
    .line 26
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->createDeviceDescriptorBinderUDA10()Lorg/fourthline/cling/binding/xml/DeviceDescriptorBinder;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->deviceDescriptorBinderUDA10:Lorg/fourthline/cling/binding/xml/DeviceDescriptorBinder;

    .line 31
    .line 32
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->createServiceDescriptorBinderUDA10()Lorg/fourthline/cling/binding/xml/ServiceDescriptorBinder;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->serviceDescriptorBinderUDA10:Lorg/fourthline/cling/binding/xml/ServiceDescriptorBinder;

    .line 37
    .line 38
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->createNamespace()Lorg/fourthline/cling/model/Namespace;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->namespace:Lorg/fourthline/cling/model/Namespace;

    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    new-instance p0, Ljava/lang/Error;

    .line 46
    .line 47
    const-string v0, "Unsupported runtime environment, use org.fourthline.cling.android.AndroidUpnpServiceConfiguration"

    .line 48
    .line 49
    invoke-direct {p0, v0}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw p0
.end method

.method public isReceivedSubscriptionTimeoutIgnored()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shutdown()V
    .locals 2

    .line 1
    sget-object v0, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    const-string v1, "Shutting down default executor service"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    return-void
.end method
