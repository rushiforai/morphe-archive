.class public Lorg/fourthline/cling/UpnpServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/UpnpService;


# annotations
.annotation runtime Ljavax/enterprise/inject/Alternative;
.end annotation


# static fields
.field private static log:Ljava/util/logging/Logger;


# instance fields
.field protected final configuration:Lorg/fourthline/cling/UpnpServiceConfiguration;

.field protected final controlPoint:Lorg/fourthline/cling/controlpoint/ControlPoint;

.field protected final protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

.field protected final registry:Lorg/fourthline/cling/registry/Registry;

.field protected final router:Lorg/fourthline/cling/transport/Router;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/UpnpServiceImpl;

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
    sput-object v0, Lorg/fourthline/cling/UpnpServiceImpl;->log:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 115
    new-instance v0, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;

    invoke-direct {v0}, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;-><init>()V

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/fourthline/cling/registry/RegistryListener;

    invoke-direct {p0, v0, v1}, Lorg/fourthline/cling/UpnpServiceImpl;-><init>(Lorg/fourthline/cling/UpnpServiceConfiguration;[Lorg/fourthline/cling/registry/RegistryListener;)V

    return-void
.end method

.method public varargs constructor <init>(Lorg/fourthline/cling/UpnpServiceConfiguration;[Lorg/fourthline/cling/registry/RegistryListener;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/UpnpServiceImpl;->configuration:Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 5
    .line 6
    sget-object p1, Lorg/fourthline/cling/UpnpServiceImpl;->log:Ljava/util/logging/Logger;

    .line 7
    .line 8
    const-string v0, ">>> Starting UPnP service..."

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object p1, Lorg/fourthline/cling/UpnpServiceImpl;->log:Ljava/util/logging/Logger;

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/fourthline/cling/UpnpServiceImpl;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "Using configuration: "

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1, v0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lorg/fourthline/cling/UpnpServiceImpl;->createProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lorg/fourthline/cling/UpnpServiceImpl;->protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/UpnpServiceImpl;->createRegistry(Lorg/fourthline/cling/protocol/ProtocolFactory;)Lorg/fourthline/cling/registry/Registry;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lorg/fourthline/cling/UpnpServiceImpl;->registry:Lorg/fourthline/cling/registry/Registry;

    .line 47
    .line 48
    array-length p1, p2

    .line 49
    const/4 v0, 0x0

    .line 50
    :goto_0
    if-ge v0, p1, :cond_0

    .line 51
    .line 52
    aget-object v1, p2, v0

    .line 53
    .line 54
    iget-object v2, p0, Lorg/fourthline/cling/UpnpServiceImpl;->registry:Lorg/fourthline/cling/registry/Registry;

    .line 55
    .line 56
    invoke-interface {v2, v1}, Lorg/fourthline/cling/registry/Registry;->addListener(Lorg/fourthline/cling/registry/RegistryListener;)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    iget-object p1, p0, Lorg/fourthline/cling/UpnpServiceImpl;->protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 63
    .line 64
    iget-object p2, p0, Lorg/fourthline/cling/UpnpServiceImpl;->registry:Lorg/fourthline/cling/registry/Registry;

    .line 65
    .line 66
    invoke-virtual {p0, p1, p2}, Lorg/fourthline/cling/UpnpServiceImpl;->createRouter(Lorg/fourthline/cling/protocol/ProtocolFactory;Lorg/fourthline/cling/registry/Registry;)Lorg/fourthline/cling/transport/Router;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lorg/fourthline/cling/UpnpServiceImpl;->router:Lorg/fourthline/cling/transport/Router;

    .line 71
    .line 72
    :try_start_0
    invoke-interface {p1}, Lorg/fourthline/cling/transport/Router;->enable()Z
    :try_end_0
    .catch Lorg/fourthline/cling/transport/RouterException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lorg/fourthline/cling/UpnpServiceImpl;->protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 76
    .line 77
    iget-object p2, p0, Lorg/fourthline/cling/UpnpServiceImpl;->registry:Lorg/fourthline/cling/registry/Registry;

    .line 78
    .line 79
    invoke-virtual {p0, p1, p2}, Lorg/fourthline/cling/UpnpServiceImpl;->createControlPoint(Lorg/fourthline/cling/protocol/ProtocolFactory;Lorg/fourthline/cling/registry/Registry;)Lorg/fourthline/cling/controlpoint/ControlPoint;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lorg/fourthline/cling/UpnpServiceImpl;->controlPoint:Lorg/fourthline/cling/controlpoint/ControlPoint;

    .line 84
    .line 85
    sget-object p0, Lorg/fourthline/cling/UpnpServiceImpl;->log:Ljava/util/logging/Logger;

    .line 86
    .line 87
    const-string p1, "<<< UPnP service started successfully"

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :catch_0
    move-exception p0

    .line 94
    new-instance p1, Ljava/lang/RuntimeException;

    .line 95
    .line 96
    new-instance p2, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v0, "Enabling network router failed: "

    .line 99
    .line 100
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    throw p1
.end method

.method public varargs constructor <init>([Lorg/fourthline/cling/registry/RegistryListener;)V
    .locals 1

    .line 114
    new-instance v0, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;

    invoke-direct {v0}, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/fourthline/cling/UpnpServiceImpl;-><init>(Lorg/fourthline/cling/UpnpServiceConfiguration;[Lorg/fourthline/cling/registry/RegistryListener;)V

    return-void
.end method

.method public static synthetic access$000()Ljava/util/logging/Logger;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/UpnpServiceImpl;->log:Ljava/util/logging/Logger;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public createControlPoint(Lorg/fourthline/cling/protocol/ProtocolFactory;Lorg/fourthline/cling/registry/Registry;)Lorg/fourthline/cling/controlpoint/ControlPoint;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/controlpoint/ControlPointImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/UpnpServiceImpl;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1, p2}, Lorg/fourthline/cling/controlpoint/ControlPointImpl;-><init>(Lorg/fourthline/cling/UpnpServiceConfiguration;Lorg/fourthline/cling/protocol/ProtocolFactory;Lorg/fourthline/cling/registry/Registry;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public createProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/protocol/ProtocolFactoryImpl;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/fourthline/cling/protocol/ProtocolFactoryImpl;-><init>(Lorg/fourthline/cling/UpnpService;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public createRegistry(Lorg/fourthline/cling/protocol/ProtocolFactory;)Lorg/fourthline/cling/registry/Registry;
    .locals 0

    .line 1
    new-instance p1, Lorg/fourthline/cling/registry/RegistryImpl;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Lorg/fourthline/cling/registry/RegistryImpl;-><init>(Lorg/fourthline/cling/UpnpService;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method public createRouter(Lorg/fourthline/cling/protocol/ProtocolFactory;Lorg/fourthline/cling/registry/Registry;)Lorg/fourthline/cling/transport/Router;
    .locals 0

    .line 1
    new-instance p2, Lorg/fourthline/cling/transport/RouterImpl;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/UpnpServiceImpl;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {p2, p0, p1}, Lorg/fourthline/cling/transport/RouterImpl;-><init>(Lorg/fourthline/cling/UpnpServiceConfiguration;Lorg/fourthline/cling/protocol/ProtocolFactory;)V

    .line 8
    .line 9
    .line 10
    return-object p2
.end method

.method public getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/UpnpServiceImpl;->configuration:Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 2
    .line 3
    return-object p0
.end method

.method public getControlPoint()Lorg/fourthline/cling/controlpoint/ControlPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/UpnpServiceImpl;->controlPoint:Lorg/fourthline/cling/controlpoint/ControlPoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/UpnpServiceImpl;->protocolFactory:Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRegistry()Lorg/fourthline/cling/registry/Registry;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/UpnpServiceImpl;->registry:Lorg/fourthline/cling/registry/Registry;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRouter()Lorg/fourthline/cling/transport/Router;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/UpnpServiceImpl;->router:Lorg/fourthline/cling/transport/Router;

    .line 2
    .line 3
    return-object p0
.end method

.method public declared-synchronized shutdown()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 21
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/UpnpServiceImpl;->shutdown(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public shutdown(Z)V
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/UpnpServiceImpl$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/fourthline/cling/UpnpServiceImpl$1;-><init>(Lorg/fourthline/cling/UpnpServiceImpl;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    new-instance p0, Ljava/lang/Thread;

    .line 9
    .line 10
    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public shutdownConfiguration()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/UpnpServiceImpl;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lorg/fourthline/cling/UpnpServiceConfiguration;->shutdown()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public shutdownRegistry()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/UpnpServiceImpl;->getRegistry()Lorg/fourthline/cling/registry/Registry;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lorg/fourthline/cling/registry/Registry;->shutdown()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public shutdownRouter()V
    .locals 5

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lorg/fourthline/cling/UpnpServiceImpl;->getRouter()Lorg/fourthline/cling/transport/Router;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lorg/fourthline/cling/transport/Router;->shutdown()V
    :try_end_0
    .catch Lorg/fourthline/cling/transport/RouterException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-static {p0}, Lorg/seamless/util/Exceptions;->unwrap(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v1, v0, Ljava/lang/InterruptedException;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    sget-object v1, Lorg/fourthline/cling/UpnpServiceImpl;->log:Ljava/util/logging/Logger;

    .line 19
    .line 20
    sget-object v2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    .line 21
    .line 22
    new-instance v3, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v4, "Router shutdown was interrupted: "

    .line 25
    .line 26
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v1, v2, p0, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget-object v1, Lorg/fourthline/cling/UpnpServiceImpl;->log:Ljava/util/logging/Logger;

    .line 41
    .line 42
    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    .line 43
    .line 44
    new-instance v3, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v4, "Router error on shutdown: "

    .line 47
    .line 48
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v1, v2, p0, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    return-void
.end method
