.class public interface abstract Lorg/fourthline/cling/UpnpServiceConfiguration;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract createDatagramIO(Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;)Lorg/fourthline/cling/transport/spi/DatagramIO;
.end method

.method public abstract createMulticastReceiver(Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;)Lorg/fourthline/cling/transport/spi/MulticastReceiver;
.end method

.method public abstract createNetworkAddressFactory()Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;
.end method

.method public abstract createStreamClient()Lorg/fourthline/cling/transport/spi/StreamClient;
.end method

.method public abstract createStreamServer(Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;)Lorg/fourthline/cling/transport/spi/StreamServer;
.end method

.method public abstract getAliveIntervalMillis()I
.end method

.method public abstract getAsyncProtocolExecutor()Ljava/util/concurrent/Executor;
.end method

.method public abstract getDatagramIOExecutor()Ljava/util/concurrent/Executor;
.end method

.method public abstract getDatagramProcessor()Lorg/fourthline/cling/transport/spi/DatagramProcessor;
.end method

.method public abstract getDescriptorRetrievalHeaders(Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;)Lorg/fourthline/cling/model/message/UpnpHeaders;
.end method

.method public abstract getDeviceDescriptorBinderUDA10()Lorg/fourthline/cling/binding/xml/DeviceDescriptorBinder;
.end method

.method public abstract getEventSubscriptionHeaders(Lorg/fourthline/cling/model/meta/RemoteService;)Lorg/fourthline/cling/model/message/UpnpHeaders;
.end method

.method public abstract getExclusiveServiceTypes()[Lorg/fourthline/cling/model/types/ServiceType;
.end method

.method public abstract getGenaEventProcessor()Lorg/fourthline/cling/transport/spi/GENAEventProcessor;
.end method

.method public abstract getMulticastReceiverExecutor()Ljava/util/concurrent/Executor;
.end method

.method public abstract getNamespace()Lorg/fourthline/cling/model/Namespace;
.end method

.method public abstract getRegistryListenerExecutor()Ljava/util/concurrent/Executor;
.end method

.method public abstract getRegistryMaintainerExecutor()Ljava/util/concurrent/Executor;
.end method

.method public abstract getRegistryMaintenanceIntervalMillis()I
.end method

.method public abstract getRemoteDeviceMaxAgeSeconds()Ljava/lang/Integer;
.end method

.method public abstract getServiceDescriptorBinderUDA10()Lorg/fourthline/cling/binding/xml/ServiceDescriptorBinder;
.end method

.method public abstract getSoapActionProcessor()Lorg/fourthline/cling/transport/spi/SOAPActionProcessor;
.end method

.method public abstract getStreamServerExecutorService()Ljava/util/concurrent/ExecutorService;
.end method

.method public abstract getSyncProtocolExecutorService()Ljava/util/concurrent/ExecutorService;
.end method

.method public abstract isReceivedSubscriptionTimeoutIgnored()Z
.end method

.method public abstract shutdown()V
.end method
