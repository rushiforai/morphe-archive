.class public Lorg/fourthline/cling/ManagedUpnpService;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/UpnpService;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;
    }
.end annotation

.annotation runtime Ljavax/enterprise/context/ApplicationScoped;
.end annotation


# static fields
.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field configuration:Ljavax/enterprise/inject/Instance;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/inject/Instance<",
            "Lorg/fourthline/cling/UpnpServiceConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field controlPointInstance:Ljavax/enterprise/inject/Instance;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/inject/Instance<",
            "Lorg/fourthline/cling/controlpoint/ControlPoint;",
            ">;"
        }
    .end annotation
.end field

.field disableRouterEvent:Ljavax/enterprise/event/Event;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/event/Event<",
            "Lorg/fourthline/cling/transport/DisableRouter;",
            ">;"
        }
    .end annotation
.end field

.field enableRouterEvent:Ljavax/enterprise/event/Event;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/event/Event<",
            "Lorg/fourthline/cling/transport/EnableRouter;",
            ">;"
        }
    .end annotation
.end field

.field protocolFactoryInstance:Ljavax/enterprise/inject/Instance;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/inject/Instance<",
            "Lorg/fourthline/cling/protocol/ProtocolFactory;",
            ">;"
        }
    .end annotation
.end field

.field registryInstance:Ljavax/enterprise/inject/Instance;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/inject/Instance<",
            "Lorg/fourthline/cling/registry/Registry;",
            ">;"
        }
    .end annotation
.end field

.field registryListenerAdapter:Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;

.field routerInstance:Ljavax/enterprise/inject/Instance;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/inject/Instance<",
            "Lorg/fourthline/cling/transport/Router;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/ManagedUpnpService;

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
    sput-object v0, Lorg/fourthline/cling/ManagedUpnpService;->log:Ljava/util/logging/Logger;

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
.method public getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService;->configuration:Ljavax/enterprise/inject/Instance;

    .line 2
    .line 3
    invoke-interface {p0}, Ljavax/enterprise/inject/Instance;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 8
    .line 9
    return-object p0
.end method

.method public getControlPoint()Lorg/fourthline/cling/controlpoint/ControlPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService;->controlPointInstance:Ljavax/enterprise/inject/Instance;

    .line 2
    .line 3
    invoke-interface {p0}, Ljavax/enterprise/inject/Instance;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/controlpoint/ControlPoint;

    .line 8
    .line 9
    return-object p0
.end method

.method public getProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService;->protocolFactoryInstance:Ljavax/enterprise/inject/Instance;

    .line 2
    .line 3
    invoke-interface {p0}, Ljavax/enterprise/inject/Instance;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 8
    .line 9
    return-object p0
.end method

.method public getRegistry()Lorg/fourthline/cling/registry/Registry;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService;->registryInstance:Ljavax/enterprise/inject/Instance;

    .line 2
    .line 3
    invoke-interface {p0}, Ljavax/enterprise/inject/Instance;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/registry/Registry;

    .line 8
    .line 9
    return-object p0
.end method

.method public getRouter()Lorg/fourthline/cling/transport/Router;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService;->routerInstance:Ljavax/enterprise/inject/Instance;

    .line 2
    .line 3
    invoke-interface {p0}, Ljavax/enterprise/inject/Instance;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/transport/Router;

    .line 8
    .line 9
    return-object p0
.end method

.method public shutdown()V
    .locals 1

    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/ManagedUpnpService;->shutdown(Lorg/fourthline/cling/UpnpService$Shutdown;)V

    return-void
.end method

.method public shutdown(Lorg/fourthline/cling/UpnpService$Shutdown;)V
    .locals 2
    .param p1    # Lorg/fourthline/cling/UpnpService$Shutdown;
        .annotation runtime Ljavax/enterprise/event/Observes;
        .end annotation
    .end param

    .line 1
    sget-object p1, Lorg/fourthline/cling/ManagedUpnpService;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    const-string v0, ">>> Shutting down managed UPnP service..."

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpService;->getRegistry()Lorg/fourthline/cling/registry/Registry;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lorg/fourthline/cling/registry/Registry;->shutdown()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lorg/fourthline/cling/ManagedUpnpService;->disableRouterEvent:Ljavax/enterprise/event/Event;

    .line 16
    .line 17
    new-instance v1, Lorg/fourthline/cling/transport/DisableRouter;

    .line 18
    .line 19
    invoke-direct {v1}, Lorg/fourthline/cling/transport/DisableRouter;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpService;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Lorg/fourthline/cling/UpnpServiceConfiguration;->shutdown()V

    .line 30
    .line 31
    .line 32
    const-string p0, "<<< Managed UPnP service shutdown completed"

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public start(Lorg/fourthline/cling/UpnpService$Start;)V
    .locals 2
    .param p1    # Lorg/fourthline/cling/UpnpService$Start;
        .annotation runtime Ljavax/enterprise/event/Observes;
        .end annotation
    .end param

    .line 1
    sget-object p1, Lorg/fourthline/cling/ManagedUpnpService;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    const-string v0, ">>> Starting managed UPnP service..."

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/fourthline/cling/ManagedUpnpService;->getRegistry()Lorg/fourthline/cling/registry/Registry;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lorg/fourthline/cling/ManagedUpnpService;->registryListenerAdapter:Lorg/fourthline/cling/ManagedUpnpService$RegistryListenerAdapter;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Lorg/fourthline/cling/registry/Registry;->addListener(Lorg/fourthline/cling/registry/RegistryListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lorg/fourthline/cling/ManagedUpnpService;->enableRouterEvent:Ljavax/enterprise/event/Event;

    .line 18
    .line 19
    new-instance v0, Lorg/fourthline/cling/transport/EnableRouter;

    .line 20
    .line 21
    invoke-direct {v0}, Lorg/fourthline/cling/transport/EnableRouter;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-interface {p0, v0}, Ljavax/enterprise/event/Event;->fire(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    const-string p0, "<<< Managed UPnP service started successfully"

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
