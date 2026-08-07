.class public Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/utils/WlanMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ConnectionInfo"
.end annotation


# instance fields
.field private ifName:Ljava/lang/String;

.field private noise:I

.field private rssi:I

.field private rxRate:I

.field private txRate:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;->ifName:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;->rssi:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;->noise:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;->txRate:I

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;->rxRate:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getIfName()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "ConnectionInfo"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;->ifName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNoise()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "ConnectionInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;->noise:I

    .line 2
    .line 3
    return p0
.end method

.method public getRssi()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "ConnectionInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;->rssi:I

    .line 2
    .line 3
    return p0
.end method

.method public getRxRate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "ConnectionInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;->rxRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getTxRate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "ConnectionInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;->txRate:I

    .line 2
    .line 3
    return p0
.end method
