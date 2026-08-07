.class public Lorg/fourthline/cling/transport/impl/StreamClientConfigurationImpl;
.super Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;
.source "SourceFile"


# instance fields
.field private usePersistentConnections:Z


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lorg/fourthline/cling/transport/impl/StreamClientConfigurationImpl;->usePersistentConnections:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;I)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lorg/fourthline/cling/transport/spi/AbstractStreamClientConfiguration;-><init>(Ljava/util/concurrent/ExecutorService;I)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lorg/fourthline/cling/transport/impl/StreamClientConfigurationImpl;->usePersistentConnections:Z

    return-void
.end method


# virtual methods
.method public isUsePersistentConnections()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/fourthline/cling/transport/impl/StreamClientConfigurationImpl;->usePersistentConnections:Z

    .line 2
    .line 3
    return p0
.end method

.method public setUsePersistentConnections(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/fourthline/cling/transport/impl/StreamClientConfigurationImpl;->usePersistentConnections:Z

    .line 2
    .line 3
    return-void
.end method
