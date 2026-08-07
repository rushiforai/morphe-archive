.class public Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/NetworkMonitorAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NetworkInformation"
.end annotation


# instance fields
.field public final handle:J

.field public final ipAddresses:[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$IPAddress;

.field public final name:Ljava/lang/String;

.field public final type:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public final underlyingTypeForVpn:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;J[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$IPAddress;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;->name:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;->type:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;->underlyingTypeForVpn:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 9
    .line 10
    iput-wide p4, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;->handle:J

    .line 11
    .line 12
    iput-object p6, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;->ipAddresses:[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$IPAddress;

    .line 13
    .line 14
    return-void
.end method

.method private getConnectionType()Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "NetworkInformation"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;->type:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 2
    .line 3
    return-object p0
.end method

.method private getHandle()J
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "NetworkInformation"
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;->handle:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private getIpAddresses()[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$IPAddress;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "NetworkInformation"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;->ipAddresses:[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$IPAddress;

    .line 2
    .line 3
    return-object p0
.end method

.method private getName()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "NetworkInformation"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private getUnderlyingConnectionTypeForVpn()Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "NetworkInformation"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkInformation;->underlyingTypeForVpn:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 2
    .line 3
    return-object p0
.end method
