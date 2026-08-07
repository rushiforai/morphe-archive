.class public Lorg/fourthline/cling/android/AndroidUpnpServiceConfiguration;
.super Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, v0}, Lorg/fourthline/cling/android/AndroidUpnpServiceConfiguration;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;-><init>(IZ)V

    .line 3
    .line 4
    .line 5
    const-string p0, "org.xml.sax.driver"

    .line 6
    .line 7
    const-string p1, "org.xmlpull.v1.sax2.Driver"

    .line 8
    .line 9
    invoke-static {p0, p1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public createDeviceDescriptorBinderUDA10()Lorg/fourthline/cling/binding/xml/DeviceDescriptorBinder;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/binding/xml/RecoveringUDA10DeviceDescriptorBinderImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/binding/xml/RecoveringUDA10DeviceDescriptorBinderImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createGENAEventProcessor()Lorg/fourthline/cling/transport/spi/GENAEventProcessor;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/transport/impl/RecoveringGENAEventProcessorImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/transport/impl/RecoveringGENAEventProcessorImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createNamespace()Lorg/fourthline/cling/model/Namespace;
    .locals 1

    .line 1
    new-instance p0, Lorg/fourthline/cling/model/Namespace;

    .line 2
    .line 3
    const-string v0, "/upnp"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lorg/fourthline/cling/model/Namespace;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public createNetworkAddressFactory(I)Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/android/AndroidNetworkAddressFactory;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/fourthline/cling/android/AndroidNetworkAddressFactory;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createSOAPActionProcessor()Lorg/fourthline/cling/transport/spi/SOAPActionProcessor;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/transport/impl/RecoveringSOAPActionProcessorImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/transport/impl/RecoveringSOAPActionProcessorImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createServiceDescriptorBinderUDA10()Lorg/fourthline/cling/binding/xml/ServiceDescriptorBinder;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/binding/xml/UDA10ServiceDescriptorBinderSAXImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/binding/xml/UDA10ServiceDescriptorBinderSAXImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createStreamClient()Lorg/fourthline/cling/transport/spi/StreamClient;
    .locals 3

    .line 1
    new-instance v0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;

    .line 2
    .line 3
    new-instance v1, Lorg/fourthline/cling/android/AndroidUpnpServiceConfiguration$1;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;->getSyncProtocolExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v1, p0, v2}, Lorg/fourthline/cling/android/AndroidUpnpServiceConfiguration$1;-><init>(Lorg/fourthline/cling/android/AndroidUpnpServiceConfiguration;Ljava/util/concurrent/ExecutorService;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;-><init>(Lorg/fourthline/cling/transport/impl/jetty/StreamClientConfigurationImpl;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public createStreamServer(Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;)Lorg/fourthline/cling/transport/spi/StreamServer;
    .locals 2

    .line 1
    new-instance p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;

    .line 2
    .line 3
    new-instance v0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;

    .line 4
    .line 5
    sget-object v1, Lorg/fourthline/cling/transport/impl/jetty/JettyServletContainer;->INSTANCE:Lorg/fourthline/cling/transport/impl/jetty/JettyServletContainer;

    .line 6
    .line 7
    invoke-interface {p1}, Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;->getStreamListenPort()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {v0, v1, p1}, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;-><init>(Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;I)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, v0}, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;-><init>(Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public getRegistryMaintenanceIntervalMillis()I
    .locals 0

    const/16 p0, 0xbb8

    return p0
.end method
