.class public Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/utils/WlanMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ScanResultInfo"
.end annotation


# instance fields
.field private channelWidth:I

.field private channleNum:I

.field private frequency:I

.field private noise:I

.field private rssi:I


# direct methods
.method public constructor <init>(IIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;->frequency:I

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;->channleNum:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;->channelWidth:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;->rssi:I

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;->noise:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getChannelWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "ScanResultInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;->channelWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getChannleNum()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "ScanResultInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;->channleNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrequency()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "ScanResultInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;->frequency:I

    .line 2
    .line 3
    return p0
.end method

.method public getNoise()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "ScanResultInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;->noise:I

    .line 2
    .line 3
    return p0
.end method

.method public getRssi()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "ScanResultInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;->rssi:I

    .line 2
    .line 3
    return p0
.end method
