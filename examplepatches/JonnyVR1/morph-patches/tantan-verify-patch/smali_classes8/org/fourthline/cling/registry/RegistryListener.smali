.class public interface abstract Lorg/fourthline/cling/registry/RegistryListener;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract afterShutdown()V
.end method

.method public abstract beforeShutdown(Lorg/fourthline/cling/registry/Registry;)V
.end method

.method public abstract localDeviceAdded(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/LocalDevice;)V
.end method

.method public abstract localDeviceRemoved(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/LocalDevice;)V
.end method

.method public abstract remoteDeviceAdded(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;)V
.end method

.method public abstract remoteDeviceDiscoveryFailed(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;Ljava/lang/Exception;)V
.end method

.method public abstract remoteDeviceDiscoveryStarted(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;)V
.end method

.method public abstract remoteDeviceRemoved(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;)V
.end method

.method public abstract remoteDeviceUpdated(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;)V
.end method
