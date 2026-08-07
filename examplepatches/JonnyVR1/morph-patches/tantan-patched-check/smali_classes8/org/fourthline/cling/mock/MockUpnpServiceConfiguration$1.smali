.class Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$1;
.super Lorg/fourthline/cling/transport/impl/NetworkAddressFactoryImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;->createNetworkAddressFactory(I)Lorg/fourthline/cling/transport/spi/NetworkAddressFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration$1;->this$0:Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lorg/fourthline/cling/transport/impl/NetworkAddressFactoryImpl;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public isUsableAddress(Ljava/net/NetworkInterface;Ljava/net/InetAddress;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    instance-of p0, p2, Ljava/net/Inet4Address;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isUsableNetworkInterface(Ljava/net/NetworkInterface;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/net/NetworkInterface;->isLoopback()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
