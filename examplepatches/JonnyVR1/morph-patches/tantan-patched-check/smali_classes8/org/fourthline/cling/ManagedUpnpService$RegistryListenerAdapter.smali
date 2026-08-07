.class Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/registry/RegistryListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/ManagedUpnpService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RegistryListenerAdapter"
.end annotation

.annotation runtime Ljavax/enterprise/context/ApplicationScoped;
.end annotation


# instance fields
.field failedRemoteDeviceDiscoveryEvent:Ljavax/enterprise/event/Event;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/event/Event<",
            "Lorg/fourthline/cling/registry/event/FailedRemoteDeviceDiscovery;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/enterprise/inject/Any;
    .end annotation
.end field

.field localDeviceDiscoveryEvent:Ljavax/enterprise/event/Event;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/event/Event<",
            "Lorg/fourthline/cling/registry/event/LocalDeviceDiscovery;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/enterprise/inject/Any;
    .end annotation
.end field

.field registryShutdownEvent:Ljavax/enterprise/event/Event;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/event/Event<",
            "Lorg/fourthline/cling/registry/event/RegistryShutdown;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/enterprise/inject/Any;
    .end annotation
.end field

.field remoteDeviceDiscoveryEvent:Ljavax/enterprise/event/Event;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/event/Event<",
            "Lorg/fourthline/cling/registry/event/RemoteDeviceDiscovery;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/enterprise/inject/Any;
    .end annotation
.end field


# direct methods
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
.method public afterShutdown()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;->registryShutdownEvent:Ljavax/enterprise/event/Event;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    new-array v1, v1, [Ljava/lang/annotation/Annotation;

    .line 5
    .line 6
    new-instance v2, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter$2;

    .line 7
    .line 8
    invoke-direct {v2, p0}, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter$2;-><init>(Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    aput-object v2, v1, p0

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljavax/enterprise/event/Event;->select([Ljava/lang/annotation/Annotation;)Ljavax/enterprise/event/Event;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Lorg/fourthline/cling/registry/event/RegistryShutdown;

    .line 19
    .line 20
    invoke-direct {v0}, Lorg/fourthline/cling/registry/event/RegistryShutdown;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {p0, v0}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public beforeShutdown(Lorg/fourthline/cling/registry/Registry;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;->registryShutdownEvent:Ljavax/enterprise/event/Event;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    new-array v0, v0, [Ljava/lang/annotation/Annotation;

    .line 5
    .line 6
    new-instance v1, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter$1;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter$1;-><init>(Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    aput-object v1, v0, p0

    .line 13
    .line 14
    invoke-interface {p1, v0}, Ljavax/enterprise/event/Event;->select([Ljava/lang/annotation/Annotation;)Ljavax/enterprise/event/Event;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Lorg/fourthline/cling/registry/event/RegistryShutdown;

    .line 19
    .line 20
    invoke-direct {p1}, Lorg/fourthline/cling/registry/event/RegistryShutdown;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public localDeviceAdded(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/LocalDevice;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;->localDeviceDiscoveryEvent:Ljavax/enterprise/event/Event;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    new-array p1, p1, [Ljava/lang/annotation/Annotation;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    sget-object v1, Lorg/fourthline/cling/registry/event/Phase;->COMPLETE:Ljavax/enterprise/util/AnnotationLiteral;

    .line 8
    .line 9
    aput-object v1, p1, v0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->select([Ljava/lang/annotation/Annotation;)Ljavax/enterprise/event/Event;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Lorg/fourthline/cling/registry/event/LocalDeviceDiscovery;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Lorg/fourthline/cling/registry/event/LocalDeviceDiscovery;-><init>(Lorg/fourthline/cling/model/meta/LocalDevice;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public localDeviceRemoved(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/LocalDevice;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;->localDeviceDiscoveryEvent:Ljavax/enterprise/event/Event;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    new-array p1, p1, [Ljava/lang/annotation/Annotation;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    sget-object v1, Lorg/fourthline/cling/registry/event/Phase;->BYEBYE:Ljavax/enterprise/util/AnnotationLiteral;

    .line 8
    .line 9
    aput-object v1, p1, v0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->select([Ljava/lang/annotation/Annotation;)Ljavax/enterprise/event/Event;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Lorg/fourthline/cling/registry/event/LocalDeviceDiscovery;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Lorg/fourthline/cling/registry/event/LocalDeviceDiscovery;-><init>(Lorg/fourthline/cling/model/meta/LocalDevice;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public remoteDeviceAdded(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;->remoteDeviceDiscoveryEvent:Ljavax/enterprise/event/Event;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    new-array p1, p1, [Ljava/lang/annotation/Annotation;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    sget-object v1, Lorg/fourthline/cling/registry/event/Phase;->COMPLETE:Ljavax/enterprise/util/AnnotationLiteral;

    .line 8
    .line 9
    aput-object v1, p1, v0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->select([Ljava/lang/annotation/Annotation;)Ljavax/enterprise/event/Event;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Lorg/fourthline/cling/registry/event/RemoteDeviceDiscovery;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Lorg/fourthline/cling/registry/event/RemoteDeviceDiscovery;-><init>(Lorg/fourthline/cling/model/meta/RemoteDevice;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public remoteDeviceDiscoveryFailed(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;->failedRemoteDeviceDiscoveryEvent:Ljavax/enterprise/event/Event;

    .line 2
    .line 3
    new-instance p1, Lorg/fourthline/cling/registry/event/FailedRemoteDeviceDiscovery;

    .line 4
    .line 5
    invoke-direct {p1, p2, p3}, Lorg/fourthline/cling/registry/event/FailedRemoteDeviceDiscovery;-><init>(Lorg/fourthline/cling/model/meta/RemoteDevice;Ljava/lang/Exception;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public remoteDeviceDiscoveryStarted(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;->remoteDeviceDiscoveryEvent:Ljavax/enterprise/event/Event;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    new-array p1, p1, [Ljava/lang/annotation/Annotation;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    sget-object v1, Lorg/fourthline/cling/registry/event/Phase;->ALIVE:Ljavax/enterprise/util/AnnotationLiteral;

    .line 8
    .line 9
    aput-object v1, p1, v0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->select([Ljava/lang/annotation/Annotation;)Ljavax/enterprise/event/Event;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Lorg/fourthline/cling/registry/event/RemoteDeviceDiscovery;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Lorg/fourthline/cling/registry/event/RemoteDeviceDiscovery;-><init>(Lorg/fourthline/cling/model/meta/RemoteDevice;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public remoteDeviceRemoved(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;->remoteDeviceDiscoveryEvent:Ljavax/enterprise/event/Event;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    new-array p1, p1, [Ljava/lang/annotation/Annotation;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    sget-object v1, Lorg/fourthline/cling/registry/event/Phase;->BYEBYE:Ljavax/enterprise/util/AnnotationLiteral;

    .line 8
    .line 9
    aput-object v1, p1, v0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->select([Ljava/lang/annotation/Annotation;)Ljavax/enterprise/event/Event;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Lorg/fourthline/cling/registry/event/RemoteDeviceDiscovery;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Lorg/fourthline/cling/registry/event/RemoteDeviceDiscovery;-><init>(Lorg/fourthline/cling/model/meta/RemoteDevice;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public remoteDeviceUpdated(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;->remoteDeviceDiscoveryEvent:Ljavax/enterprise/event/Event;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    new-array p1, p1, [Ljava/lang/annotation/Annotation;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    sget-object v1, Lorg/fourthline/cling/registry/event/Phase;->UPDATED:Ljavax/enterprise/util/AnnotationLiteral;

    .line 8
    .line 9
    aput-object v1, p1, v0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->select([Ljava/lang/annotation/Annotation;)Ljavax/enterprise/event/Event;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Lorg/fourthline/cling/registry/event/RemoteDeviceDiscovery;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Lorg/fourthline/cling/registry/event/RemoteDeviceDiscovery;-><init>(Lorg/fourthline/cling/model/meta/RemoteDevice;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
