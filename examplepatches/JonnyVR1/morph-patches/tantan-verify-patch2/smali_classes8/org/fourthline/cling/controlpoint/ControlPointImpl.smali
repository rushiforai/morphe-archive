.class public Lorg/fourthline/cling/controlpoint/ControlPointImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/controlpoint/ControlPoint;


# annotations
.annotation runtime Ljavax/enterprise/context/ApplicationScoped;
.end annotation


# static fields
.field private static log:Ljava/util/logging/Logger;


# instance fields
.field protected configuration:Lorg/fourthline/cling/UpnpServiceConfiguration;

.field protected protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

.field protected registry:Lorg/fourthline/cling/registry/Registry;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;

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
    sput-object v0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->log:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/UpnpServiceConfiguration;Lorg/fourthline/cling/protocol/ProtocolFactory;Lorg/fourthline/cling/registry/Registry;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->log:Ljava/util/logging/Logger;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "Creating ControlPoint: "

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->configuration:Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 24
    .line 25
    iput-object p2, p0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 26
    .line 27
    iput-object p3, p0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->registry:Lorg/fourthline/cling/registry/Registry;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public execute(Lorg/fourthline/cling/controlpoint/ActionCallback;)Ljava/util/concurrent/Future;
    .locals 3

    .line 1
    sget-object v0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Invoking action in background: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Lorg/fourthline/cling/controlpoint/ActionCallback;->setControlPoint(Lorg/fourthline/cling/controlpoint/ControlPoint;)Lorg/fourthline/cling/controlpoint/ActionCallback;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Lorg/fourthline/cling/UpnpServiceConfiguration;->getSyncProtocolExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public execute(Lorg/fourthline/cling/controlpoint/SubscriptionCallback;)V
    .locals 3

    .line 37
    sget-object v0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->log:Ljava/util/logging/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invoking subscription in background: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 38
    invoke-virtual {p1, p0}, Lorg/fourthline/cling/controlpoint/SubscriptionCallback;->setControlPoint(Lorg/fourthline/cling/controlpoint/ControlPoint;)V

    .line 39
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    move-result-object p0

    invoke-interface {p0}, Lorg/fourthline/cling/UpnpServiceConfiguration;->getSyncProtocolExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public execute(Lorg/fourthline/cling/controlpoint/event/ExecuteAction;)V
    .locals 0

    .line 36
    invoke-virtual {p1}, Lorg/fourthline/cling/controlpoint/event/ExecuteAction;->getCallback()Lorg/fourthline/cling/controlpoint/ActionCallback;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->execute(Lorg/fourthline/cling/controlpoint/ActionCallback;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->configuration:Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRegistry()Lorg/fourthline/cling/registry/Registry;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->registry:Lorg/fourthline/cling/registry/Registry;

    .line 2
    .line 3
    return-object p0
.end method

.method public search()V
    .locals 2

    .line 44
    new-instance v0, Lorg/fourthline/cling/model/message/header/STAllHeader;

    invoke-direct {v0}, Lorg/fourthline/cling/model/message/header/STAllHeader;-><init>()V

    sget-object v1, Lorg/fourthline/cling/model/message/header/MXHeader;->DEFAULT_VALUE:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->search(Lorg/fourthline/cling/model/message/header/UpnpHeader;I)V

    return-void
.end method

.method public search(I)V
    .locals 1

    .line 46
    new-instance v0, Lorg/fourthline/cling/model/message/header/STAllHeader;

    invoke-direct {v0}, Lorg/fourthline/cling/model/message/header/STAllHeader;-><init>()V

    invoke-virtual {p0, v0, p1}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->search(Lorg/fourthline/cling/model/message/header/UpnpHeader;I)V

    return-void
.end method

.method public search(Lorg/fourthline/cling/controlpoint/event/Search;)V
    .locals 1
    .param p1    # Lorg/fourthline/cling/controlpoint/event/Search;
        .annotation runtime Ljavax/enterprise/event/Observes;
        .end annotation
    .end param

    .line 47
    invoke-virtual {p1}, Lorg/fourthline/cling/controlpoint/event/Search;->getSearchType()Lorg/fourthline/cling/model/message/header/UpnpHeader;

    move-result-object v0

    invoke-virtual {p1}, Lorg/fourthline/cling/controlpoint/event/Search;->getMxSeconds()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->search(Lorg/fourthline/cling/model/message/header/UpnpHeader;I)V

    return-void
.end method

.method public search(Lorg/fourthline/cling/model/message/header/UpnpHeader;)V
    .locals 1

    .line 45
    sget-object v0, Lorg/fourthline/cling/model/message/header/MXHeader;->DEFAULT_VALUE:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->search(Lorg/fourthline/cling/model/message/header/UpnpHeader;I)V

    return-void
.end method

.method public search(Lorg/fourthline/cling/model/message/header/UpnpHeader;I)V
    .locals 3

    .line 1
    sget-object v0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Sending asynchronous search for: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lorg/fourthline/cling/model/message/header/UpnpHeader;->getString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lorg/fourthline/cling/UpnpServiceConfiguration;->getAsyncProtocolExecutor()Ljava/util/concurrent/Executor;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;->getProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0, p1, p2}, Lorg/fourthline/cling/protocol/ProtocolFactory;->createSendingSearch(Lorg/fourthline/cling/model/message/header/UpnpHeader;I)Lorg/fourthline/cling/protocol/async/SendingSearch;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
