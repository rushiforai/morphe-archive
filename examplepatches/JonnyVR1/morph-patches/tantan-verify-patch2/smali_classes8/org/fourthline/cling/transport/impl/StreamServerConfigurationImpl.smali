.class public Lorg/fourthline/cling/transport/impl/StreamServerConfigurationImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/transport/spi/StreamServerConfiguration;


# instance fields
.field private listenPort:I

.field private tcpConnectionBacklog:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lorg/fourthline/cling/transport/impl/StreamServerConfigurationImpl;->listenPort:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getListenPort()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/transport/impl/StreamServerConfigurationImpl;->listenPort:I

    .line 2
    .line 3
    return p0
.end method

.method public getTcpConnectionBacklog()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/transport/impl/StreamServerConfigurationImpl;->tcpConnectionBacklog:I

    .line 2
    .line 3
    return p0
.end method

.method public setListenPort(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/fourthline/cling/transport/impl/StreamServerConfigurationImpl;->listenPort:I

    .line 2
    .line 3
    return-void
.end method

.method public setTcpConnectionBacklog(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/fourthline/cling/transport/impl/StreamServerConfigurationImpl;->tcpConnectionBacklog:I

    .line 2
    .line 3
    return-void
.end method
