.class public interface abstract Lorg/fourthline/cling/registry/Registry;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract addDevice(Lorg/fourthline/cling/model/meta/LocalDevice;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/registry/RegistrationException;
        }
    .end annotation
.end method

.method public abstract addDevice(Lorg/fourthline/cling/model/meta/LocalDevice;Lorg/fourthline/cling/model/DiscoveryOptions;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/registry/RegistrationException;
        }
    .end annotation
.end method

.method public abstract addDevice(Lorg/fourthline/cling/model/meta/RemoteDevice;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/registry/RegistrationException;
        }
    .end annotation
.end method

.method public abstract addListener(Lorg/fourthline/cling/registry/RegistryListener;)V
.end method

.method public abstract addLocalSubscription(Lorg/fourthline/cling/model/gena/LocalGENASubscription;)V
.end method

.method public abstract addRemoteSubscription(Lorg/fourthline/cling/model/gena/RemoteGENASubscription;)V
.end method

.method public abstract addResource(Lorg/fourthline/cling/model/resource/Resource;)V
.end method

.method public abstract addResource(Lorg/fourthline/cling/model/resource/Resource;I)V
.end method

.method public abstract advertiseLocalDevices()V
.end method

.method public abstract getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;
.end method

.method public abstract getDevice(Lorg/fourthline/cling/model/types/UDN;Z)Lorg/fourthline/cling/model/meta/Device;
.end method

.method public abstract getDevices()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/fourthline/cling/model/meta/Device;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDevices(Lorg/fourthline/cling/model/types/DeviceType;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/fourthline/cling/model/types/DeviceType;",
            ")",
            "Ljava/util/Collection<",
            "Lorg/fourthline/cling/model/meta/Device;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDevices(Lorg/fourthline/cling/model/types/ServiceType;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/fourthline/cling/model/types/ServiceType;",
            ")",
            "Ljava/util/Collection<",
            "Lorg/fourthline/cling/model/meta/Device;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDiscoveryOptions(Lorg/fourthline/cling/model/types/UDN;)Lorg/fourthline/cling/model/DiscoveryOptions;
.end method

.method public abstract getListeners()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/fourthline/cling/registry/RegistryListener;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLocalDevice(Lorg/fourthline/cling/model/types/UDN;Z)Lorg/fourthline/cling/model/meta/LocalDevice;
.end method

.method public abstract getLocalDevices()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/fourthline/cling/model/meta/LocalDevice;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLocalSubscription(Ljava/lang/String;)Lorg/fourthline/cling/model/gena/LocalGENASubscription;
.end method

.method public abstract getProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;
.end method

.method public abstract getRemoteDevice(Lorg/fourthline/cling/model/types/UDN;Z)Lorg/fourthline/cling/model/meta/RemoteDevice;
.end method

.method public abstract getRemoteDevices()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/fourthline/cling/model/meta/RemoteDevice;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getRemoteSubscription(Ljava/lang/String;)Lorg/fourthline/cling/model/gena/RemoteGENASubscription;
.end method

.method public abstract getResource(Ljava/lang/Class;Ljava/net/URI;)Lorg/fourthline/cling/model/resource/Resource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/fourthline/cling/model/resource/Resource;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/net/URI;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract getResource(Ljava/net/URI;)Lorg/fourthline/cling/model/resource/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract getResources()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/fourthline/cling/model/resource/Resource;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getResources(Ljava/lang/Class;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/fourthline/cling/model/resource/Resource;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/Collection<",
            "TT;>;"
        }
    .end annotation
.end method

.method public abstract getService(Lorg/fourthline/cling/model/ServiceReference;)Lorg/fourthline/cling/model/meta/Service;
.end method

.method public abstract getUpnpService()Lorg/fourthline/cling/UpnpService;
.end method

.method public abstract getWaitRemoteSubscription(Ljava/lang/String;)Lorg/fourthline/cling/model/gena/RemoteGENASubscription;
.end method

.method public abstract isPaused()Z
.end method

.method public abstract notifyDiscoveryFailure(Lorg/fourthline/cling/model/meta/RemoteDevice;Ljava/lang/Exception;)V
.end method

.method public abstract notifyDiscoveryStart(Lorg/fourthline/cling/model/meta/RemoteDevice;)Z
.end method

.method public abstract pause()V
.end method

.method public abstract registerPendingRemoteSubscription(Lorg/fourthline/cling/model/gena/RemoteGENASubscription;)V
.end method

.method public abstract removeAllLocalDevices()V
.end method

.method public abstract removeAllRemoteDevices()V
.end method

.method public abstract removeDevice(Lorg/fourthline/cling/model/meta/LocalDevice;)Z
.end method

.method public abstract removeDevice(Lorg/fourthline/cling/model/meta/RemoteDevice;)Z
.end method

.method public abstract removeDevice(Lorg/fourthline/cling/model/types/UDN;)Z
.end method

.method public abstract removeListener(Lorg/fourthline/cling/registry/RegistryListener;)V
.end method

.method public abstract removeLocalSubscription(Lorg/fourthline/cling/model/gena/LocalGENASubscription;)Z
.end method

.method public abstract removeRemoteSubscription(Lorg/fourthline/cling/model/gena/RemoteGENASubscription;)V
.end method

.method public abstract removeResource(Lorg/fourthline/cling/model/resource/Resource;)Z
.end method

.method public abstract resume()V
.end method

.method public abstract setDiscoveryOptions(Lorg/fourthline/cling/model/types/UDN;Lorg/fourthline/cling/model/DiscoveryOptions;)V
.end method

.method public abstract shutdown()V
.end method

.method public abstract unregisterPendingRemoteSubscription(Lorg/fourthline/cling/model/gena/RemoteGENASubscription;)V
.end method

.method public abstract update(Lorg/fourthline/cling/model/meta/RemoteDeviceIdentity;)Z
.end method

.method public abstract updateLocalSubscription(Lorg/fourthline/cling/model/gena/LocalGENASubscription;)Z
.end method

.method public abstract updateRemoteSubscription(Lorg/fourthline/cling/model/gena/RemoteGENASubscription;)V
.end method
