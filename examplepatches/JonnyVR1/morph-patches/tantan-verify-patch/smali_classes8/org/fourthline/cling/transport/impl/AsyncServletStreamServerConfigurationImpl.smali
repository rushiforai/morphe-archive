.class public Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/transport/spi/StreamServerConfiguration;


# instance fields
.field protected asyncTimeoutSeconds:I

.field protected listenPort:I

.field protected servletContainerAdapter:Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->listenPort:I

    .line 6
    .line 7
    const/16 v0, 0x3c

    .line 8
    .line 9
    iput v0, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->asyncTimeoutSeconds:I

    .line 10
    .line 11
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->servletContainerAdapter:Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;I)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3c

    .line 15
    iput v0, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->asyncTimeoutSeconds:I

    .line 16
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->servletContainerAdapter:Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;

    .line 17
    iput p2, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->listenPort:I

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;II)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->servletContainerAdapter:Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;

    .line 20
    iput p2, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->listenPort:I

    .line 21
    iput p3, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->asyncTimeoutSeconds:I

    return-void
.end method


# virtual methods
.method public getAsyncTimeoutSeconds()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->asyncTimeoutSeconds:I

    .line 2
    .line 3
    return p0
.end method

.method public getListenPort()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->listenPort:I

    .line 2
    .line 3
    return p0
.end method

.method public getServletContainerAdapter()Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->servletContainerAdapter:Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAsyncTimeoutSeconds(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->asyncTimeoutSeconds:I

    .line 2
    .line 3
    return-void
.end method

.method public setListenPort(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->listenPort:I

    .line 2
    .line 3
    return-void
.end method

.method public setServletContainerAdapter(Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->servletContainerAdapter:Lorg/fourthline/cling/transport/spi/ServletContainerAdapter;

    .line 2
    .line 3
    return-void
.end method
