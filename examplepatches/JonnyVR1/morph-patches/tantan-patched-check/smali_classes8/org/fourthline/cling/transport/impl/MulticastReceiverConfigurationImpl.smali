.class public Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/transport/spi/MulticastReceiverConfiguration;


# instance fields
.field private group:Ljava/net/InetAddress;

.field private maxDatagramBytes:I

.field private port:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 13
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object p1

    const/16 v0, 0x280

    invoke-direct {p0, p1, p2, v0}, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;-><init>(Ljava/net/InetAddress;II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 12
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;-><init>(Ljava/net/InetAddress;II)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;I)V
    .locals 1

    const/16 v0, 0x280

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;-><init>(Ljava/net/InetAddress;II)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;->group:Ljava/net/InetAddress;

    .line 5
    .line 6
    iput p2, p0, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;->port:I

    .line 7
    .line 8
    iput p3, p0, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;->maxDatagramBytes:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getGroup()Ljava/net/InetAddress;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;->group:Ljava/net/InetAddress;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxDatagramBytes()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;->maxDatagramBytes:I

    .line 2
    .line 3
    return p0
.end method

.method public getPort()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;->port:I

    .line 2
    .line 3
    return p0
.end method

.method public setGroup(Ljava/net/InetAddress;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;->group:Ljava/net/InetAddress;

    .line 2
    .line 3
    return-void
.end method

.method public setMaxDatagramBytes(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;->maxDatagramBytes:I

    .line 2
    .line 3
    return-void
.end method

.method public setPort(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/fourthline/cling/transport/impl/MulticastReceiverConfigurationImpl;->port:I

    .line 2
    .line 3
    return-void
.end method
