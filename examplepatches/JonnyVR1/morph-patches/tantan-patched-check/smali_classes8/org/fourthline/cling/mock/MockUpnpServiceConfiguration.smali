.class public Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;
.super Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;
.source "SourceFile"


# annotations
.annotation runtime Ljavax/enterprise/inject/Alternative;
.end annotation


# instance fields
.field protected final maintainsRegistry:Z

.field protected final multiThreaded:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, v0, v0}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;-><init>(ZZ)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, p1, v0}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;-><init>(ZZ)V

    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;-><init>(Z)V

    .line 3
    .line 4
    .line 5
    iput-boolean p1, p0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;->maintainsRegistry:Z

    .line 6
    .line 7
    iput-boolean p2, p0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;->multiThreaded:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public createNetworkAddressFactory(I)Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$1;-><init>(Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;->isMultiThreaded()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lorg/fourthline/cling/DefaultUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$3;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$3;-><init>(Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public getRegistryMaintainerExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;->isMaintainsRegistry()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$2;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$2;-><init>(Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;->getDefaultExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public isMaintainsRegistry()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;->maintainsRegistry:Z

    .line 2
    .line 3
    return p0
.end method

.method public isMultiThreaded()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;->multiThreaded:Z

    .line 2
    .line 3
    return p0
.end method
