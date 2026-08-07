.class Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/NetworkMonitorAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NetworkState"
.end annotation


# instance fields
.field private final connected:Z

.field private final subtype:I

.field private final type:I

.field private final underlyingNetworkSubtypeForVpn:I

.field private final underlyingNetworkTypeForVpn:I


# direct methods
.method public constructor <init>(ZIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->connected:Z

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->type:I

    .line 7
    .line 8
    iput p3, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->subtype:I

    .line 9
    .line 10
    iput p4, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->underlyingNetworkTypeForVpn:I

    .line 11
    .line 12
    iput p5, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->underlyingNetworkSubtypeForVpn:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getNetworkSubType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->subtype:I

    .line 2
    .line 3
    return p0
.end method

.method public getNetworkType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->type:I

    .line 2
    .line 3
    return p0
.end method

.method public getUnderlyingNetworkSubtypeForVpn()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->underlyingNetworkSubtypeForVpn:I

    .line 2
    .line 3
    return p0
.end method

.method public getUnderlyingNetworkTypeForVpn()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->underlyingNetworkTypeForVpn:I

    .line 2
    .line 3
    return p0
.end method

.method public isConnected()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$NetworkState;->connected:Z

    .line 2
    .line 3
    return p0
.end method
